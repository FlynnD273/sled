class_name Browser extends Control


signal file_opened(path: String)


@export var path: String


@onready var browser_tree: BrowserTree = %BrowserTree


func _ready() -> void:
	refresh_tree()
	browser_tree.file_opened.connect(func(path: String): file_opened.emit(path))


func refresh_tree() -> void:
	browser_tree.populate_tree(path)
