extends Control

@onready var button: Button = $Button
@onready var button_2: Button = $Button2
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var data: Control = $data
@onready var ui: CanvasLayer = $UI
@onready var main_menu: Control = $"."
@onready var button_3: Button = $Button3





var ram = "user://ram.save"


func _ready() -> void:
	audio_stream_player_2d.play()
	data.is_on_menu = true
	
func _on_button_pressed() -> void:
	ui.ui_lifes = 3
	ui.ui_stars = 0
	ui.saveUi()
	ui.save_ui_stars()

	print("Dados salvos por main_menu. Vidas:" + str(ui.ui_lifes))
	get_tree().change_scene_to_file("res://scenes/stage_1.tscn")
	Engine.time_scale = 1.0


func _on_button_2_pressed():
	get_tree().quit()


func _on_button_3_pressed() -> void:
	data.btn_next_stage.visible = false
	data.btn_voltar.visible = true
	data.my_condition = data.Condition.LOAD
	data.exibirTela()


func _on_data_fechar_menu() -> void:
	main_menu.visible = true
