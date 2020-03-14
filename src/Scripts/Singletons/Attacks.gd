extends Node



# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var attack_dict:Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var jsonFile = File.new()
	jsonFile.open("res://Resources/attacks.json", jsonFile.READ)
	var text_json = jsonFile.get_as_text()
	print("text is " + text_json)
	var result_json:JSONParseResult = JSON.parse(text_json)
	
	if result_json.error == OK:
		attack_dict = result_json.result
	else:
		print("Error code: ", result_json.error)
		print("Error Line: ", result_json.error_line)
		print("Error String: ", result_json.error_string)

	
