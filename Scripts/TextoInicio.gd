extends Node

@onready var rich_text_label = $RichTextLabel
@onready var timer = $Timer

func _ready():
	# Asegúrate de que el Timer esté configurado para llamar a la función _on_timer_timeout cuando termine
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	
	# Inicia el temporizador con el tiempo deseado
	timer.start()

func _on_timer_timeout():
	# Oculta el RichTextLabel cuando el temporizador termine
	rich_text_label.visible = false
