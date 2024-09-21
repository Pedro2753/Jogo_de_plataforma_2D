extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var ui: CanvasLayer = $UI
@onready var data: Control = $data






func _ready() -> void:
	print("Dados Carregados por game _ready. Vidas:" + str(ui.ui_lifes))
	ui.show_message("A sua Jornada se inicia!")
