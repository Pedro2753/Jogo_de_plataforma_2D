extends Control

@onready var button: Button = $Button
@onready var button_2: Button = $Button2



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")



func _on_button_2_pressed() -> void:
	get_tree().quit()
