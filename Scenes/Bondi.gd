extends Node2D

@onready var animations = $AnimatedSprite2D
@export var speed: float = 200.0  # Velocidad de movimiento en píxeles por segundo
@export var target_position: Vector2 = Vector2.ZERO  # Punto al que se moverá el auto
@export var win_scene_path: String = "res://scenes/Win.tscn"  # Ruta a la escena de win

var reached_target = false  # Variable para verificar si el auto llegó al objetivo
var animation_player: AnimationPlayer

func _ready():
	# Obtiene la referencia del AnimationPlayer
	animations.play("Bondi_andando")
	$Timer.start()
	
func _on_timer_timeout():
	print("tiempoo")
	
func _process(delta):
	# Calcula la dirección hacia el punto objetivo
	var direction = (target_position - position).normalized()
	
	# Mueve el auto en la dirección calculada con la velocidad especificada
	position += direction * speed * delta

	# Comprueba si el auto ha alcanzado o superado el punto objetivo
	if position.distance_to(target_position) < speed * delta:
		position = target_position  # Alinea el auto con la posición exacta del objetivo
		reached_target = true  # Marca que el auto ha llegado al objetivo
		set_process(false)  # Detiene el movimiento
		if animation_player:
			animation_player.stop()  # Detiene la animación

func _on_area_2d_body_entered(body):
	if body.name == "Player" and reached_target:
		# Carga y cambia a la escena de win si se ha alcanzado el objetivo
		get_tree().change_scene_to_file(win_scene_path)
