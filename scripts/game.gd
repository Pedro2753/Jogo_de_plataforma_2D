extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var ui: CanvasLayer = $UI
@onready var respawn_point: Marker2D = $RespawnPoint




func _ready() -> void:
	ui.show_message("A sua Jornada se inicia!")
