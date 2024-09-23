extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var ui: CanvasLayer = $UI
@onready var data: Control = $data

var stage = 1



func _ready() -> void:
	ui.loadUi()
	print("Dados Carregados por game _ready. Vidas:" + str(ui.ui_lifes))
	ui.show_message("A sua Jornada se inicia!")
	ui.setStage(stage)
