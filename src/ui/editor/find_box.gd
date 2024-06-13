class_name FindBox extends LowerPanelContainer


enum Mode {
	FIND,
	REPLACE,
}


signal pattern_changed(pattern: String, use_regex: bool, case_insensitive: bool)
signal select_all_occurrences_requested()
signal replace_all_occurrences_requested()
signal go_to_previous_requested()
signal go_to_next_requested()
signal replace_requested()


@onready var pattern_line_edit: LineEdit = %PatternLineEdit
@onready var replacement_line_edit: LineEdit = %ReplacementLineEdit
@onready var select_all_occurrences_button: Button = %SelectAllOccurrencesButton
@onready var replace_all_occurrences_button: Button = %ReplaceAllOccurrencesButton
@onready var previous_match_button: Button = %PreviousMatchButton
@onready var match_count_label: Label = %MatchCountLabel
@onready var next_match_button: Button = %NextMatchButton
@onready var replace_button: Button = %ReplaceButton
@onready var case_insensitive_toggle: CheckBox = %CaseInsensitiveToggle
@onready var regex_toggle: CheckBox = %RegExToggle
@onready var replace_toggle: CheckBox = %ReplaceToggle


func _ready() -> void:
	switch_modes(Mode.REPLACE if replace_toggle.button_pressed else Mode.FIND)
	replace_toggle.toggled.connect(func(state: bool): switch_modes(Mode.REPLACE if state else Mode.FIND))
	pattern_line_edit.text_changed.connect(_emit_changed)
	regex_toggle.toggled.connect(_emit_changed)
	case_insensitive_toggle.toggled.connect(_emit_changed)
	select_all_occurrences_button.pressed.connect(func(): select_all_occurrences_requested.emit())
	replace_all_occurrences_button.pressed.connect(func(): replace_all_occurrences_requested.emit())
	previous_match_button.pressed.connect(func(): go_to_previous_requested.emit())
	next_match_button.pressed.connect(func(): go_to_next_requested.emit())
	replace_button.pressed.connect(func(): replace_requested.emit())
	visibility_changed.connect(func(): if visible: pattern_line_edit.grab_focus(), CONNECT_DEFERRED)


func switch_modes(mode: Mode = Mode.FIND) -> void:
	NodeUtil.foreach_child(self,
		func(child: Control):
			if not child.is_in_group(&"find") and not child.is_in_group(&"replace"):
				return
			child.visible = (child.is_in_group(&"find") and mode == Mode.FIND) or (child.is_in_group(&"replace") and mode == Mode.REPLACE)
	)


func set_match_count(count: int) -> void:
	if count:
		match_count_label.remove_theme_color_override(&"font_color")
	else:
		match_count_label.add_theme_color_override(&"font_color", EditorThemeManager.theme.get_color(&"font_color", &"Label").lerp(Color.RED, 0.3))
	match_count_label.text = str(count)


func set_invalid_pattern(is_invalid: bool) -> void:
	if is_invalid:
		pattern_line_edit.add_theme_color_override(&"font_color", EditorThemeManager.theme.get_color(&"font_color", &"LineEdit").lerp(Color.RED, 0.3))
	else:
		pattern_line_edit.remove_theme_color_override(&"font_color")


func _emit_changed(_arg) -> void:
	pattern_changed.emit(pattern_line_edit.text, regex_toggle.button_pressed, case_insensitive_toggle.button_pressed)


func _on_close_button_pressed() -> void:
	hide()


func _on_pattern_line_edit_text_submitted(new_text: String) -> void:
	go_to_next_requested.emit()
