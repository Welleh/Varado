extends State

func enter():
	state_owner.animations.play("death")

func _on_animated_sprite_2d_animation_finished():
	if owner.is_death == true:
		owner.queue_free()
