extends Camera2D

var currentTilemap : TileMap
var playerPos : Vector2

func _ready():
	Event.connect("focusTilemap", self, "updateCurrentTilemap")
	Event.connect("playerMovement", self, "onPlayerMove")

func updateCurrentTilemap(t): currentTilemap = t
func onPlayerMove(v): playerPos = v

func _process(delta):
	
	
	# get tilemapCenter
	
	var tilemapCenterY = (currentTilemap.get_used_rect().size.y / 2) * 32
	
	position.y = tilemapCenterY - playerPos.y
	position.x = 0
	
