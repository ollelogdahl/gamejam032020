 	extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var viableAttacks = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func attack():
	
	pass

func add_attack(attackObject):
	
	viableAttacks[attackObject] = attackObject;
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.



var last_attack_time = 0
var time_elapsed_from_last_click = 0

var last_combo_check = 0
var combo = []

var time_passed = 0

var combo_update_offset = Rythm.seconds_between_beats

var attacks_from_last_beat = 0

var last_combo_printed = null
func _process(delta):
	
	time_passed += delta	
	
	var attack_time = null
	
	if Input.is_action_just_pressed("attack"):
		
		# resets the timer to make sure that time syncs with the first hit you make
		
			
		attacks_from_last_beat += 1
		pass
	
	if time_passed > last_combo_check + combo_update_offset:
		print("checks combo")
		last_combo_check = time_passed
		
		if attacks_from_last_beat == 0:
			print("combo cleared")
			combo.clear()
			
		else:
			combo.append(attacks_from_last_beat)
		print(combo)
		attacks_from_last_beat = 0
		
		pass
	
	
	# Process every BPM and update combo
	
	
	
	pass
