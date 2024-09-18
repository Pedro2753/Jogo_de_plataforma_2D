extends Control

@onready var game: Node = $GameManger
@onready var life_label: Label = $CanvasLayer/game1/life_label
@onready var coin_label: Label = $CanvasLayer/game1/coin_label
@onready var star_label: Label = $CanvasLayer/game1/star_label
@onready var stage_label: Label = $CanvasLayer/game1/stage_label
@onready var game_1: Button = $CanvasLayer/game1
@onready var canvas_layer: CanvasLayer = $CanvasLayer


var save_path = "user://variable.save"

# var condition = ""

var coins = 0
var stars = 0
var lifes = 0
var stage = 0

enum Condition { SAVE, LOAD, DELETE }

@export var my_condition: Condition

func setStar():
	stars =+ 1
	print("Estrela adicionada")
	print(stars)



func _ready():
	canvas_layer.visible = false

func _unhandled_input(event):
		if event.is_action_pressed("save_btn"):
			my_condition = Condition.SAVE
			exibirTela()

func exibirTela():
	read_data()
	canvas_layer.visible = true
	print("Tela Exibida")
	
	


func _on_game_1_pressed() -> void:
	match my_condition:
		Condition.SAVE:
			save_data()
		Condition.LOAD:
			load_data()
		Condition.DELETE:
			delete_data()
	
	"""
	if condition == "save":
		save_data()
	elif condition == "load":
		load_data()
		#script para carregar os dados
	elif condition
	"""

func save_data():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(coins)
	file.store_var(lifes)
	file.store_var(stars)
	file.store_var(stage)
	life_label.text = "Lifes:" + str(lifes)
	coin_label.text = "Coins:" + str(coins)
	star_label.text = "Stars:" + str(stars)
	stage_label.text = "Stage:" + str(stage)
	print("Condição save prenchida")

func read_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		coins = file.get_var(coins)
		lifes = file.get_var(lifes)
		stars = file.get_var(stars)
		stage = file.get_var(stage)
		life_label.text = "Lifes:" + str(lifes)
		coin_label.text = "Coins:" + str(coins)
		star_label.text = "Stars:" + str(stars)
		stage_label.text = "Stage:" + str(stage)
		print("dados carregados")
	else:
		print("no data saved...")

func load_data():
	print("condicao load prenchida")

func delete_data():
	pass
