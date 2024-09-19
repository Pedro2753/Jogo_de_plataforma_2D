extends Node

var coins = 0
var stars = 0
var lifes = 3
var stage = 1

func setStar():
	stars =+ 1
	print("Estrela adicionada")
	print(stars)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
