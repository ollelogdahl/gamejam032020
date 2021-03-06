extends Node

var allRooms = []

var level1_rooms = []

var wormScene = load("res://Scenes/Enemies/Worm.tscn")

func loadRoomScenes():
	level1_rooms = loadScenesFromFolder("res://Scenes/Rooms/Level_1")
	
func loadScenesFromFolder(folder):
	var l = []
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		
		var rn = dir.get_next()
		while(rn):
			if rn == ".." or rn == ".":
				pass
			else:
				var path = "%s/%s" % [folder, rn]
				l.append( load(path) )
			
			rn = dir.get_next()
		dir.list_dir_end()
	return l

func _ready():
	loadRoomScenes()
