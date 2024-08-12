extends State

func enter():
	state_owner.animations.play("attack_01")
	$"../../Swoosh".play()

func update(delta):
	if owner.is_death:
		state_machine.transition_to("StateEnemyDeath")
		return
		
	if $"../../Root/AnimatedSprite2D".frame == 2:
		$"../../Root/Attack_01/CollisionShape2D".disabled = false

func _on_animated_sprite_2d_animation_finished():
	if owner.attack:
		owner.attack = false
		$"../../Root/Attack_01/CollisionShape2D".disabled = true
		state_machine.transition_to("StateEnemyMovement")
