extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var ui: CanvasLayer = $UI

func _ready() -> void:
	ui.show_message("A sua Jornada se inicia!")
	
class Progress:
	var _name := ("")
	var lifes := 3
	var stars := 0
	var double_jump : bool = false
	var sword : bool = false
	var hp := 1
	var run : bool = false
	
	
var player1 := Progress.new()
var player2 := Progress.new()
var player3 := Progress.new()
