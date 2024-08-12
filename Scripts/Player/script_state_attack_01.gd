extends State

func enter():
	state_owner.animations.play("attack_01")

func update(delta):
	if $"../../Root/AnimatedSprite2D".frame == 8:
		if not $"../../Swoosh".playing:
			$"../../Swoosh".play()
		
		$"../../Root/Atack_01/CollisionShape2D".disabled = false

func _on_animated_sprite_2d_animation_finished():
	$"../../Root/Atack_01/CollisionShape2D".disabled = true
	state_machine.transition_to("StateMovement")
