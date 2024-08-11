extends CharacterBody2D

@onready var animations = $Root/AnimatedSprite2D
var life = 4
var death = false
@onready var state_machine = get_node_or_null("StateMachine")  # Ajusta la ruta según la estructura de tu escena

func _on_atack_01_body_entered(body):
	if body.is_in_group("Enemy"):
		body.death()

func take_damage(amount: int):
	life -= amount
	if life <= 0 and not death:
		die()
		
func die():
	if not death:  # Solo cambiar al estado de muerte si no está en el estado de muerte
		death = true
		state_machine.transition_to("StateDeath")
