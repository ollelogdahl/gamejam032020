extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func generateRoom():
	var index = int(rand_range(0, Resources.allRooms.size()))
	var roomScene = Resources.allRooms[index]
	
	var room = roomScene.instance()
	add_child(room)

func _ready() -> void:
	generateRoom()
