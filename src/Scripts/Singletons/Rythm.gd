extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var seconds_between_beats = 1
var BPM:int = 130 setget set_BPM

# Called when the node enters the scene tree for the first time.
func _ready():
	set_BPM(101)
	pass # Replace with function body.


func set_BPM(new_BPM:int)->void:
	BPM = new_BPM
	seconds_between_beats = 60/float(BPM)
	print(60/BPM)
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
