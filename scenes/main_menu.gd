extends Control

@onready var button: Button = $Button
@onready var button_2: Button = $Button2
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var data: Control = $data
@onready var ui: CanvasLayer = $UI


var ram = "user://ram.save"


func _ready() -> void:
	audio_stream_player_2d.play()


func _on_button_pressed() -> void:
	data.lifes = 3
	data.stars = 0
	data.stage = 1

	print("Dados salvos por main_menu. Vidas:" + str(data.lifes))
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	Engine.time_scale = 1.0


func _on_button_2_pressed():
	get_tree().quit()


func _on_button_3_pressed() -> void:
	data.my_condition = data.Condition.LOAD
	data.exibirTela()
