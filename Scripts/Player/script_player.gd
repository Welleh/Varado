extends CharacterBody2D

@onready var animations = $Root/AnimatedSprite2D
var life = 3
var attack = false
var death = false

func hit():
	$Root/AnimatedSprite2D.modulate = Color.RED
	life -= 1
	
	if life <= 0:
		death = true

func _on_atack_01_body_entered(body):
	if body.is_in_group("Enemy"):
		body.death()

func _on_player_area_body_entered(body):
	print("Tocame")
	hit()
