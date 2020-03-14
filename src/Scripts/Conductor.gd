extends Node


var count = 0
var waitTime
# Called when the node enters the scene tree for the first time.
func _ready():
	Event.emit_signal("syncBeatTime")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.

var elapsed_time = 0
func _process(delta):
	
	pass


func play_sound():
	$BeatPlayer.play()
func _on_Timer_timeout():
	
	
	
	pass # Replace with function body.
