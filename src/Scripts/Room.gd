extends Node2D

onready var tilemap = $Tilemap
onready var spawnpoints = $Spawnpoints
onready var enter = $Enter
onready var door = $Door


func room_cleared():
	door.visible = false
	pass

func _on_RoomCleared_body_entered(body: PhysicsBody2D):
	
	if body.is_in_group("player"):
		Event.emit_signal("levelCleared")
	pass # Replace with function body.
