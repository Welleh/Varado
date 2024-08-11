extends State

const SPEED = 1000.0

var life = 4

func pyhsics_update(delta):
	if Input.is_action_just_pressed("Attack_01"):
		owner.attack = true
		state_machine.transition_to("StateAttack_01")
		return
	
	var horizontal_direction = Input.get_axis("ui_left", "ui_right")
	var vertical_direction = Input.get_axis("ui_up", "ui_down")
	
	if horizontal_direction:
		state_owner.velocity.x = horizontal_direction * SPEED
		$"../../Root".scale.x = 1 if horizontal_direction > 0 else -1
	else:
		state_owner.velocity.x = move_toward(state_owner.velocity.x, 0, SPEED)
	
	if vertical_direction:
		state_owner.velocity.y = vertical_direction * SPEED
	else:
		state_owner.velocity.y = move_toward(state_owner.velocity.y, 0, SPEED)
	
	if state_owner.velocity != Vector2.ZERO:
		state_owner.animations.play("walk")
	else:
		state_owner.animations.play("idle")
	
	state_owner.move_and_slide()
