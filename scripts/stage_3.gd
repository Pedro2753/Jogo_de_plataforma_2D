extends Node2D

@onready var ui: CanvasLayer = $UI
@onready var data: Control = $data
@onready var all_coin_label: RichTextLabel = $Player/Camera2D/all_coin_label
@onready var chicken: CharacterBody2D = $Chicken

var stage = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ui.setStage(stage)
	ui.loadUi()
	ui.load_ui_stars()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
@onready var animation_player: AnimationPlayer = $camera_zoom/AnimationPlayer


func _on_galinheiro_body_entered(body: Node2D) -> void:
	all_coin_label.text = "[wave][rainbow][b][center]Quest da galinha completo![/center][/b][/rainbow][/wave]"
	await get_tree().create_timer(2).timeout
	chicken.queue_free()
	ui.add_star()
	all_coin_label.text = "[wave][rainbow][b][center]+1 Estrela[/center][/b][/rainbow][/wave]"
	await get_tree().create_timer(2).timeout
	all_coin_label.text = ""
