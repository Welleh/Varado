extends State

func enter():
	state_owner.animations.play("death")

func update(delta):
	if $"../../Root/AnimatedSprite2D".frame == 8:
		$"../../Root/Atack_01/CollisionShape2D".disabled = false

func _on_animated_sprite_2d_animation_finished():
	if owner.death == true:
		owner.queue_free()
