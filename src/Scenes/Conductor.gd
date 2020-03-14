extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = Rythm.seconds_between_beats
	$Timer.start()
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	pass


func _on_Timer_timeout():
	
	$BeatPlayer.play()
	pass # Replace with function body.
