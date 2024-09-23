extends Node2D

@onready var ui: CanvasLayer = $UI
@onready var data: Control = $data

var stage = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ui.setStage(stage)
	ui.loadUi()
	ui.load_ui_stars()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
