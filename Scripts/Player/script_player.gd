extends CharacterBody2D

@onready var animations = $Root/AnimatedSprite2D
var life = 3
var death = false

func _on_atack_01_body_entered(body):
	if body.is_in_group("Enemy"):
		body.death()
