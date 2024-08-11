extends State

func enter():
	state_owner.animations.play("idle")

func update(delta):
	if owner.attack == true:
		state_machine.transition_to("StateEnemyAttack_01")
		return
	
	if owner.is_death == true:
		state_machine.transition_to("StateEnemyDeath")
		return
		
func _process(delta):
	#movement.
	if owner.player != null:
		owner.velocity = Vector2(0, 0)
		owner.position.x = move_toward(owner.position.x, owner.player.get("position").x, owner.speed * delta)
		owner.position.y = move_toward(owner.position.y, owner.player.get("position").y, owner.speed * delta)
	
	owner.move_and_slide()

