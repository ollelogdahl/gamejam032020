extends Entity
class_name EntityAI

onready var world = $"../../"

var speed := 10

var target
var path := PoolVector2Array() setget set_path
var pathAvailable

enum AIState {
	DISABLED,
	NOPATH,
	WALK,
	ATTACK,
	STAGGER
}
var state = AIState.NOPATH

func _ready():
	target = world.player
	
	$Timer.wait_time = randf() * 0.4
	set_process(false)
	calculatePath()

# tries to walk towards target
func walk(delta):
	var nextPos = nextPathNode()
	if pathAvailable:
		var movement = nextPos - position
		velocity = movement.normalized() * speed * delta * 100

# returns true if target is seen
func isTargetSeen():
	$RayCast2D.cast_to = target.position - position
	if $RayCast2D.is_colliding():
		var col = $RayCast2D.get_collider()
		if not col is KinematicBody2D:
			return false
		if col.get_instance_id() == target.get_instance_id():
			return true
	return false

func set_path(val : PoolVector2Array) -> void:
	path = val
	if val.size() == 0:
		set_process(false)
	else:
		set_process(true)

func calculatePath():
	path = world.navmesh.get_simple_path(global_position, target.global_position, true)
	set_path(path)
	
func nextPathNode():
	if len(path) > 0:
		if(position.distance_to(path[0]) < 0.5):
			path.remove(0)
		pathAvailable = true
		if len(path) > 0:
			return path[0]
	pathAvailable = false
	return null

func _on_Timer_timeout():
	if not $Timer.wait_time == 0.4:
		$Timer.wait_time = 0.4
	calculatePath()
	pass
	
func takeDamage(dmg,b,c):
	if health - dmg <= 0:
		#world.addEnemyDeathScore(scoreOnDeath)
		pass
	.takeDamage(dmg,b,c)
