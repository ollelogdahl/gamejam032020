extends Node

var allRooms = []

func loadRoomScenes():
	var dir = Directory.new()
	if dir.open("res://Scenes/Rooms/") == OK:
		dir.list_dir_begin()
		
		var rn = dir.get_next()
		while(rn):
			if rn == ".." or rn == ".":
				pass
			else:
				var path = "res://Scenes/Rooms/%s" % rn
				allRooms.append( load(path) )
			
			rn = dir.get_next()
		dir.list_dir_end()

func _ready():
	loadRoomScenes()
