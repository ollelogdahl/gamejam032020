 	extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var conductor = $"../Conductor"


export var movementSpeed = 200


var ON_BEAT_MARGIN = 0.2
var COMBO_MARGIN = 0.1

var viableAttacks = {}

var currentCombo = []

var beatLength:float = Rythm.seconds_between_beats
# Called when the node enters the scene tree for the first time.
func _ready():
	
	syncBeatTime()
	
	Event.connect("syncBeatTime", self, "syncBeatTime")
	pass # Replace with function body.


func syncBeatTime():
	time_since_last_beat = 0
	beatLength = Rythm.seconds_between_beats
	
	pass

func add_attack(attackObject):
	
	viableAttacks[attackObject] = attackObject;
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.



var last_attack_time = 0
var time_elapsed_from_last_click = 0

var last_combo_check = 0
var combo = []

var time_since_last_beat = 0

var seconds_bewtween_beats = Rythm.seconds_between_beats

var attacks_from_last_beat = 0

var last_combo_printed = null

var main_beat = 0

var last_hit_on_main_beat :bool = false

var combo_attempted = null
var time_last_combo_click = null
var perfect_combo_time_diff = null

var half_printed =false

var mouse_pressed_timings = []

var newBeatJustStarted = false

func execute_combo():
	
	if currentCombo != []:
		print("GOO COMBO: ", currentCombo)
	currentCombo.clear()
	


func time_diff(mouse_timings:Array):
	var combo_attempted = mouse_timings.size()
	var correct_time_diff = beatLength/combo_attempted
	
	var diff_sum = 0
	for timing_nr in range(combo_attempted):
		
		if (timing_nr == 0):
			continue
			pass
		var diff = abs(correct_time_diff * timing_nr - mouse_timings[timing_nr])
		
		diff_sum += diff
	
	var weighed_sum = diff_sum*beatLength
	
	if (weighed_sum < 0.15):
		currentCombo.append(combo_attempted)
		print("Combo succeded: ", combo_attempted)
	else:
		currentCombo.clear()

func beat_passed():
	print("attempted combo = ", mouse_pressed_timings.size())
	time_diff(mouse_pressed_timings)
	
	mouse_pressed_timings = []
	pass
	


var beats_without_press =0

func _unhandled_input(event):
	if Input.is_action_just_pressed("attack"):
		
		if time_since_last_beat < ON_BEAT_MARGIN \
		or time_since_last_beat > beatLength - ON_BEAT_MARGIN:
			beats_without_press = 0
			last_hit_on_main_beat = true
			newBeatJustStarted = true
			
			
			if mouse_pressed_timings.size() != 0:
				beat_passed()
			
			mouse_pressed_timings.append(time_since_last_beat)
		
		elif last_hit_on_main_beat:
			beats_without_press = 0
			mouse_pressed_timings.append(time_since_last_beat)
#			

		

func _process(delta):
	# movement
	
	var dx = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var dy =  Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	move_and_collide(Vector2(dx, dy).normalized() * movementSpeed * delta)
	
	# dumdum
	time_since_last_beat += delta
	
	
	
	if time_since_last_beat > ON_BEAT_MARGIN and time_since_last_beat < beatLength/2:
		newBeatJustStarted = false

	

	if time_since_last_beat > beatLength:
		beats_without_press += 1
		conductor.play_sound()
		time_since_last_beat = 0
		
		if beats_without_press > 1:
			execute_combo()
		
		if newBeatJustStarted == false:
			
		
			last_hit_on_main_beat = false
		
			if mouse_pressed_timings.size() != 0 and last_hit_on_main_beat == false:
					beat_passed()
