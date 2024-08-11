extends State

var animation_played = false

func enter():
	print("Entrando en el estado de muerte")
	if not animation_played:
		state_owner.animations.play("death")
		animation_played = true

func update(delta):
	if $"../../Root/AnimatedSprite2D".frame == 8:
		$"../../Root/Atack_01/CollisionShape2D".disabled = false

func _on_animated_sprite_2d_animation_finished():
	if owner.death == true:
		owner.queue_free()
		load_lose_scene()
		
func load_lose_scene():
	var lose_scene = preload("res://scenes/Win.tscn")
	get_tree().change_scene_to(lose_scene)
