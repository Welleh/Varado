extends State

func enter():
	state_owner.animations.play("death")

func load_lose_scene():
	get_tree().change_scene_to_file("res://Scenes/Lose.tscn")

func _on_animated_sprite_2d_animation_finished():
	if state_owner.death == true:
		state_owner.queue_free()
		load_lose_scene()
