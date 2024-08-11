class_name MainMenu
extends Control

@onready var play_button = $"MarginContainer/HBoxContainer/VBoxContainer/Play Button" as Button
@onready var exit_button = $"MarginContainer/HBoxContainer/VBoxContainer/Exit Button" as Button
@onready var start_level = preload("res://Scenes/World.tscn") as PackedScene #Especificar ruta de la escena principal

func _ready():
	play_button.button_down.connect(on_play_pressed)
	exit_button.button_down.connect(on_exit_pressed)



func on_play_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)
func on_exit_pressed() -> void:
	get_tree().quit()
