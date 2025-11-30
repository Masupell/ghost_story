class_name World
extends Node2D

var levels: Array = get_levels_from_folder("res://World/Maps")

var current_level: Node = null
var current = 0

func _ready() -> void:
	load_level(current)

func load_level(idx: int):
	if current_level:
		current_level.queue_free()
	if current > levels.size() || levels.is_empty():
		print(current_level)
		return
	var level: PackedScene = load(levels[idx])
	current_level = level.instantiate()
	add_child(current_level)




func get_levels_from_folder(path: String) -> Array:
	var level_array := []
	var dir := DirAccess.open(path)
	for file in dir.get_files():
		if file.ends_with(".tscn"):
			level_array.append(path + "/" + file)
	print(levels)
	return level_array
