extends CharacterBody2D

@onready var animations = $Root/AnimatedSprite2D
@export var hud : HUD  # Referencia al HUD
var life = 4
var death = false
@onready var state_machine = get_node_or_null("StateMachine")

func _ready():
	# Busca el nodo HUD en el grupo "hud"
	#hud = get_tree().get_first_node_in_group("hud")
	update_life_label()

func _on_atack_01_body_entered(body):
	if body.is_in_group("Enemy"):
		body.death()

func take_damage(amount: int):
	life -= amount
	update_life_label()
	if life <= 0 and not death:
		die()

func update_life_label():
	# Actualiza el texto del LifeLabel en el HUD
	var score_label = hud.get_node("LifeLabel")
	score_label.text = "x" + str(life)

func die():
	if not death:
		death = true
		state_machine.transition_to("StateDeath")
