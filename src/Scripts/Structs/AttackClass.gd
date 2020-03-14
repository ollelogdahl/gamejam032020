extends Node

class_name AttackClass
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var combo:Array = []
var attack_name
var function_call:String

# Called when the node enters the scene tree for the first time.
func _init(_attack_name, inp_combo, func_call):
	attack_name = _attack_name
	combo = inp_combo
	function_call = func_call
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
