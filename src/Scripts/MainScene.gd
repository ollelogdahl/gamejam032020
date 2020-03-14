extends Node2D

onready var player = $Player
onready var navmesh = $RoomCreator

func _ready():
	Event.emit_signal("mainConstructed")
