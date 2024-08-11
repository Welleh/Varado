extends Node2D

@onready var animations = $AnimatedSprite2D  # Asegúrate de que el nodo AnimatedSprite2D sea el correcto
@export var speed: float = 200.0  # Velocidad de movimiento en píxeles por segundo
@export var target_position: Vector2 = Vector2.ZERO  # Punto al que se moverá el auto
@export var win_scene_path: String = "res://scenes/Win.tscn"  # Ruta a la escena de win

var reached_target = false  # Variable para verificar si el auto llegó al objetivo
var timer: Timer
var moving = false  # Controla si el auto debe moverse

func _ready():
	# Configura el temporizador para esperar 60 segundos
	timer = $Timer  # Asegúrate de que el nodo Timer se llama "Timer" en la escena
	timer.wait_time = 60  # 1 minuto
	timer.one_shot = true  # Solo se dispara una vez
	timer.start()  # Inicia el temporizador

	# Detenemos la animación al inicio
	animations.stop()

func _on_timer_timeout():
	print("Temporizador completado. Iniciando animación y movimiento.")
	# Comienza la animación y el movimiento después de 1 minuto
	animations.play("Bondi_andando")
	moving = true  # Permite que el auto comience a moverse

func _process(delta):
	if moving:
		# Calcula la dirección hacia el punto objetivo
		var direction = (target_position - position).normalized()
		
		# Mueve el auto en la dirección calculada con la velocidad especificada
		position += direction * speed * delta

		# Comprueba si el auto ha alcanzado o superado el punto objetivo
		if position.distance_to(target_position) < speed * delta:
			position = target_position  # Alinea el auto con la posición exacta del objetivo
			reached_target = true  # Marca que el auto ha llegado al objetivo
			moving = false  # Detiene el movimiento
			if animations:
				animations.stop()  # Detiene la animación si es necesario

func _on_area_2d_body_entered(body):
	if body.name == "Player" and reached_target:
		# Carga y cambia a la escena de win si se ha alcanzado el objetivo
		get_tree().change_scene_to_file(win_scene_path)
