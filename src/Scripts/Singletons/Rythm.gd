extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var seconds_between_beats = 1
var BPM:int = 60 setget set_BPM

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_BPM(new_BPM:int)->void:
	BPM = new_BPM
	seconds_between_beats = 60/BPM
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
