extends State

func enter():
	$"../../Root/Atack_01/CollisionShape2D".disabled = false
	state_owner.animations.play("attack_01")


func _on_animated_sprite_2d_animation_finished():
	$"../../Root/Atack_01/CollisionShape2D".disabled = true
	state_machine.transition_to("StateMovement")
