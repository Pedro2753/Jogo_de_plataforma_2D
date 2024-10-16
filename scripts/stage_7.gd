extends Node2D

@onready var ui: CanvasLayer = $UI
@onready var data: Control = $data
@onready var all_coin_label: RichTextLabel = $Player/Camera2D/all_coin_label
@onready var chicken: CharacterBody2D = $Chicken
@onready var sign: Area2D = $Sign/Sign
@onready var label: Label = $Sign/Sign4/Label

var stage = 7

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ui.setStage(stage)
	ui.loadUi()
	ui.load_ui_stars()
	ui.show_message("THE FINAL STAGE")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
