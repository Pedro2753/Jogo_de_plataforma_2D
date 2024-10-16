extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var ui: CanvasLayer = $UI
@onready var data: Control = $data
@onready var all_coin_label: RichTextLabel = $Player/Camera2D/all_coin_label
@onready var chicken: CharacterBody2D = $Chicken
@onready var label: Label = $Signs/Sign/Label
@onready var label2: Label = $Signs/Sign2/Label
@onready var label3: Label = $Signs/Sign3/Label

var stage = 1



func _ready() -> void:
	ui.loadUi()
	print("Dados Carregados por game _ready. Vidas:" + str(ui.ui_lifes))
	ui.show_message("Your Journey Begins!")
	ui.setStage(stage)


func _on_area_2d_body_entered(body: Node2D) -> void:
	all_coin_label.text = "[wave][rainbow][b][center]Chicken Quest Completed![/center][/b][/rainbow][/wave]"
	await get_tree().create_timer(2).timeout
	chicken.queue_free()
	ui.add_star()
	all_coin_label.text = "[wave][rainbow][b][center]+1 Star[/center][/b][/rainbow][/wave]"
	await get_tree().create_timer(2).timeout
	all_coin_label.text = ""


func _on_sign_body_entered(body: Node2D) -> void:
	label.text = "Singular Mount up ahead" 


func _on_sign_body_exited(body: Node2D) -> void:
	label.text = ""

func _on_sign_3_body_entered(body: Node2D) -> void:
	label3.text = "Be careful!" 


func _on_sign_3_body_exited(body: Node2D) -> void:
	label3.text = ""


func _on_sign_2_body_entered(body: Node2D) -> void:
	label2.text = "No possible return, from 1.000m high onward"


func _on_sign_2_body_exited(body: Node2D) -> void:
	label2.text = ""
