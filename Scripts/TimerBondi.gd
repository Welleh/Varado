extends Node2D

@onready var timer: Timer = $Timer
@onready var time_label: Label = $TimeLabel
@onready var message_label: Label = $MessageLabel  # Asegúrate de que existe un nodo Label con este nombre

var time_left: float = 62.0  # Tiempo inicial en segundos

func _ready():
	# Verifica que los nodos existen
	if message_label == null or time_label == null:
		print("Error: No se encontró uno de los nodos 'MessageLabel' o 'TimeLabel'. Verifica el nombre y asegúrate de que los nodos existen.")
		return
	
	# Configura el temporizador
	timer.wait_time = 1.0  # El tiempo de espera entre las señales "timeout" (1 segundo)
	timer.one_shot = false  # Hacer que el temporizador se reinicie automáticamente
	timer.start()  # Inicia el temporizador

	# Configura el mensaje oculto al principio
	message_label.visible = false  # Oculta el mensaje al inicio

	# Conectar la señal timeout del Timer a una función
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))

	# Mostrar el tiempo inicial en el Label
	time_label.text = "Tiempo: " + str(time_left) + " s"

func _on_timer_timeout():
	# Decrementa el tiempo restante
	time_left -= 1.0
	
	# Actualiza el texto del Label con el tiempo restante
	time_label.text = "Tiempo: " + str(time_left) + " s"
	
	# Cuando el tiempo llegue a 0, mostrar el mensaje
	if time_left <= 0:
		timer.stop()  # Detener el temporizador
		time_label.visible = false  # Ocultar el TimeLabel
		message_label.text = "¡Subite al bondi!"
		message_label.visible = true  # Mostrar el mensaje


