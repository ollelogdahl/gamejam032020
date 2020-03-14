extends Camera2D

var currentTilemap : TileMap
onready var world = $"../"



var shakeDuration = 0.0
var shakePeriod = 0.0
var shakeAmplitude = 0.0
var timer = 0.0
var lastTimer = 0
var prevX = 0
var prevY = 0
var lastOffset := Vector2(0, 0)



func _ready():
	Event.connect("focusTilemap", self, "updateCurrentTilemap")
	Event.connect("mainConstructed", self, "onMainReady")
	
	#shake(10, 24, 1.4)
	set_process(false)

func updateCurrentTilemap(t): currentTilemap = t

func _process(delta):
	# get tilemapCenter
	if currentTilemap:
		var tilemapCenterY = (currentTilemap.get_used_rect().size.y / 2) * 32
	
		position.y = tilemapCenterY - (tilemapCenterY - world.player.position.y)/2
		position.x = 0
	else:
		position = world.player.position
		
		
	# do screenshake
	if timer == 0:
		print("shake ended")
		set_offset(Vector2())
		return
	lastTimer = lastTimer + delta
	while lastTimer >= shakePeriod:
		lastTimer = lastTimer - shakePeriod
		var intensity = shakeAmplitude * (1 - ((shakeDuration - timer) / shakeDuration))
		
		var newX = rand_range(-1.0, 1.0)
		var xComp = intensity * (prevX + (delta * (newX - prevX)))
		var newY = rand_range(-1.0, 1.0)
		var yComp = intensity * (prevY + (delta * (newY - prevY)))
		
		prevX = newX
		prevY = newY
		
		var newOffset = Vector2(xComp, yComp)
		set_offset(get_offset() - lastOffset + newOffset)
		lastOffset = newOffset
	timer = timer - delta
	if timer <= 0:
		timer = 0
		set_offset(get_offset() - lastOffset)

func shake(duration, frequency, amplitude):
	if shakeAmplitude > amplitude:
		return
	
	shakeDuration = duration
	shakeAmplitude = amplitude
	timer = duration
	shakePeriod = 1.0 / frequency
	prevX = rand_range(-1.0, 1.0)
	prevY = rand_range(-1.0, 1.0)
	
	set_offset(get_offset() - lastOffset)
	lastOffset = Vector2(0, 0)

func onMainReady():
	set_process(true)
