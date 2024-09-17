extends Control

@onready var button: Button = $Button
@onready var button_2: Button = $Button2
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _ready() -> void:
	audio_stream_player_2d.play()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")



func _on_button_2_pressed() -> void:
	get_tree().quit()
