extends Node2D

### Export variables
export var g_copies_of_each: int = 2
export var g_path: String = ""

var g_object_pool: Array = []
var g_object_pool_available: Array = []

func _ready():
	var paths: Array = _get_full_paths(g_path)
	print(paths)
	for path in paths:
		var resource = load(path)
		for _i in g_copies_of_each:
			var object: Node2D = resource.instance()
#			object.global_position = _get_random_global_position(object)
			object.global_position = Vector2(0,0)
			g_object_pool.append(object)
			g_object_pool_available.append(object)
			get_parent().call_deferred('add_child_below_node', self, object)
	
#	g_max_available_objects = paths.size() * g_copies_of_each

func _process(_delta: float) -> void:
	pass

# Given a path to either a file or directory, returns a list of all the paths 
# for which we should instance a resource.
# @param path either a file (.tscn) or a directory of scene files.
# @return the path names for which we should instance a resource.
func _get_full_paths(path: String) -> Array:
	if path.ends_with('.tscn'):
		return [path]
	
	var files = _list_files_in_directory(path)
	var paths = []
	for file in files:
		paths.append(path + file)
	return paths

# Given a path to a directory, returns the names of all
# files in that directory.
# @param path the path to a directory, e.g. "res://scenes/characters/""
# @return the names of all files in that directory, e.g. ["CaptainHook.tscn"]
func _list_files_in_directory(path: String) -> Array:
	var files: Array = []
	var dir := Directory.new()

	dir.open(path)
	
	# Initialize stream used to list all files and directories
	dir.list_dir_begin()

	while true:
		var file: String = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)
	
	# Close stream
	dir.list_dir_end()

	return files
