extends "res://Scenes/Menus/menu_principal.gd"

func _on_play_button_pressed():
	$AudioStreamPlayer.play()
	get_tree().change_scene_to_file("res://Scenes/Menus/menu_principal.tscn")
