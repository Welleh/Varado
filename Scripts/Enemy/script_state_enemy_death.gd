extends State

func enter():
	state_owner.animations.play("death")
<<<<<<< Updated upstream
=======
	var my_random_number = rng.randi_range(0, 2)
	
	$"../../Punched".play()
	
	if (my_random_number == 0):
		$"../../Death_01".play()
	
	if (my_random_number == 1):
		$"../../Death_02".play()
		
	if (my_random_number == 2):
		$"../../Death_03".play()
	
>>>>>>> Stashed changes

func _on_animated_sprite_2d_animation_finished():
	if owner.is_death == true:
		owner.queue_free()
