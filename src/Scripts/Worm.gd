extends EntityAI
	
func _ready():
	speed = 20
	health = 20


func _process(delta):
	if not state == AIState.DISABLED:
		# player seen
		var targetSeen = isTargetSeen()
		var withinAttackRange = withinAttackRange()
	
		if not withinAttackRange: state = AIState.WALK
		elif not targetSeen: state = AIState.WALK
		
		elif withinAttackRange: state = AIState.ATTACK
	
	if state == AIState.WALK:   walk(delta)
	if state == AIState.ATTACK: attack()

func attack(): pass
	#var projectile = preload("res://Scenes/shockWave_enemy.tscn").instance()
	
	#projectile.position = self.global_position
	#projectile.direction = -(position - target.position).normalized()
	#projectileContainer.add_child(projectile)

func withinAttackRange():
	if target.global_position.distance_to(self.global_position) < 14:
		return true
	return false

func deleteSelf():
	queue_free()
