extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var ui: CanvasLayer = $UI
@onready var data: Control = $data
@onready var chicken: CharacterBody2D = $Chicken
@onready var label: Label = $Signs/Sign/Label
@onready var label2: Label = $Signs/Sign2/Label
@onready var label3: Label = $Signs/Sign3/Label
@onready var chickens: Node = $Chickens
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var all_coin_label: RichTextLabel = $Player/Camera2D/all_coin_label

var stage = 6
var addNew = true


func _ready() -> void:
	ui.loadUi()
	print("Dados Carregados por game _ready. Vidas:" + str(ui.ui_lifes))
	ui.show_message("MOVE ALL THE CHICKENS TO THE BARN")
	ui.setStage(stage)

	
func _process(delta: float) -> void:
	if ui.galinhas >= 100 && addNew :
		chickens.queue_free()
		addNew = false
		ui.galinha_label.visible = false
		audio_stream_player.play()
		await get_tree().create_timer(4).timeout
		all_coin_label.text = "[wave][rainbow][b][center]Chicken Quest Completed![/center][/b][/rainbow][/wave]"
		await get_tree().create_timer(4).timeout
		ui.add_star()
		await get_tree().create_timer(4).timeout
		all_coin_label.text = ""
		






func _on_area_2d_body_entered(body: Node2D) -> void:
	ui.add_galinhas()




	

func _on_area_2d_body_exited(body: Node2D) -> void:
	ui.dec_galinhas()
