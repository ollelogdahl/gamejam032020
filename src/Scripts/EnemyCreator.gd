extends Node

func spawnEnemy(e, pos):
	var obj = e.instance()
	
	obj.global_position = pos
	
	add_child(obj)
	Event.emit_signal("enemySpawned", obj.name)
