extends Control
class_name HUD

@export var life_label : Label  # Asegúrate de asignar esto en el Inspector al nodo Label
@export var timer_bondi : Node2D  # Si tienes un temporizador o cualquier otro nodo que quieras manejar

# Called when the node enters the scene tree for the first time.
func _ready():
	# Asegúrate de que el nodo life_label esté correctamente asignado
	if not life_label:
		life_label = $LifeLabel
	pass
