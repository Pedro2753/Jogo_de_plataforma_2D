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
	ui.show_message("A sua Jornada se inicia!")
	ui.setStage(stage)


func _on_area_2d_body_entered(body: Node2D) -> void:
	all_coin_label.text = "[wave][rainbow][b][center]Quest da galinha completo![/center][/b][/rainbow][/wave]"
	await get_tree().create_timer(2).timeout
	chicken.queue_free()
	ui.add_star()
	all_coin_label.text = "[wave][rainbow][b][center]+1 Estrela[/center][/b][/rainbow][/wave]"
	await get_tree().create_timer(2).timeout
	all_coin_label.text = ""


func _on_sign_body_entered(body: Node2D) -> void:
	label.text = "Montanha da singularidade logo a frente" 


func _on_sign_body_exited(body: Node2D) -> void:
	label.text = ""

func _on_sign_3_body_entered(body: Node2D) -> void:
	label3.text = "Cuidado, montanha singular" 


func _on_sign_3_body_exited(body: Node2D) -> void:
	label3.text = ""


func _on_sign_2_body_entered(body: Node2D) -> void:
	label2.text = "Sem possivel retorno a partir dos 100m"


func _on_sign_2_body_exited(body: Node2D) -> void:
	label2.text = ""
