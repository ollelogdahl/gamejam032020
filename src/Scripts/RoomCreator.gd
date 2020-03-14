extends Node

onready var enemySpawner = $"../EnemyCreator"

func createLayoutInstance():
	var index = int(rand_range(0, Resources.allRooms.size()))
	var roomScene = Resources.allRooms[index]
	return roomScene.instance()

func populateRoom(room):
	# temp, make all enemies worm
	for point in room.spawnpoints.get_children():
		enemySpawner.spawnEnemy(Resources.wormScene, point.global_position)

func generateRoom():
	var room = createLayoutInstance()
	add_child(room)
	
	Event.emit_signal("focusTilemap", room.tilemap)
	
	populateRoom(room)

func _ready() -> void:
	randomize()
	generateRoom()
