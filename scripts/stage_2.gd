extends Node2D
@onready var ui: CanvasLayer = $UI


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	data.loadUi()
	data.load_ui_stars()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
