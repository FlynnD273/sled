extends Node


const LAST_OPENED_PATHS_PATH: String = "user://last_opened.sled"
const MAX_RECENT_ITEMS: int = 8


signal changed_paths()


var last_opened_paths: PackedStringArray = []
var current_path: String = ""
var absolute_base_path: String = ""


func _ready() -> void:
	last_opened_paths = File.load_variant(LAST_OPENED_PATHS_PATH, [])
	
	await RenderingServer.frame_post_draw
	if last_opened_paths:
		change_path(last_opened_paths[0])


func change_path(new_path: String) -> void:
	new_path = new_path.replace("\\", "/")
	current_path = new_path
	
	var index = last_opened_paths.find(new_path)
	if index > -1:
		last_opened_paths.remove_at(index)
	last_opened_paths.insert(0, current_path)
	
	if last_opened_paths.size() > MAX_RECENT_ITEMS:
		last_opened_paths.resize(MAX_RECENT_ITEMS)
	
	File.save_variant(LAST_OPENED_PATHS_PATH, last_opened_paths)
	absolute_base_path = get_base_path(new_path)
	changed_paths.emit()


func change_path_browse() -> void:
	var fd := FileDialog.new()
	fd.access = FileDialog.ACCESS_FILESYSTEM
	fd.use_native_dialog = true
	fd.file_mode = FileDialog.FILE_MODE_OPEN_DIR
	
	add_child(fd)
	
	fd.show.call_deferred()
	
	fd.dir_selected.connect(
			func(dir: String):
				change_path(dir)
				fd.queue_free()
				)
	fd.visibility_changed.connect(
			func():
				if fd.visible == false:
					fd.queue_free()
					)


func get_base_path(path: String, valid_names: PackedStringArray = Settings.settings.base_paths.split(",", false)) -> String:
	for dir in DirAccess.get_directories_at(path):
		if dir in valid_names:
			return path.path_join(dir)
		else:
			return get_base_path(path.path_join(dir), valid_names)
	return ""


func clear_recent() -> void:
	last_opened_paths = []
	File.save_variant(LAST_OPENED_PATHS_PATH, last_opened_paths)
