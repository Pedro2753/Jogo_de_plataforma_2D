extends Node2D

@onready var ui: CanvasLayer = $UI
@onready var data: Control = $data
@onready var all_coin_label: RichTextLabel = $Player/Camera2D/all_coin_label
@onready var chicken: CharacterBody2D = $Chicken
@onready var sign: Area2D = $Sign/Sign
@onready var label: Label = $Sign/Sign4/Label

var stage = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ui.setStage(stage)
	ui.loadUi()
	ui.load_ui_stars()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	all_coin_label.text = "[wave][rainbow][b][center]Quest da galinha completo![/center][/b][/rainbow][/wave]"
	await get_tree().create_timer(2).timeout
	chicken.queue_free()
	ui.add_star()
	all_coin_label.text = "[wave][rainbow][b][center]+1 Estrela[/center][/b][/rainbow][/wave]"
	await get_tree().create_timer(2).timeout
	all_coin_label.text = ""










func _on_sign_4_body_entered(body: Node2D) -> void:
	label.text = "Cuidado, precipício a frente"


func _on_sign_4_body_exited(body: Node2D) -> void:
	label.text = ""
