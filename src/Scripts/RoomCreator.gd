extends Node

onready var enemySpawner = $"../EnemyCreator"
onready var world = $"../"

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
	
	# move player to spawnpoint in room
	world.player.global_position = room.enter.global_position
	
	populateRoom(room)
	
	Event.emit_signal("focusTilemap", room.tilemap)

func _ready() -> void:
	Event.connect("mainConstructed", self, "onMainReady")
	
func onMainReady():
	randomize()
	generateRoom()
