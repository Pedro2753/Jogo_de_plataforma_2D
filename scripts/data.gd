extends Control



@onready var life_label: Label = $CanvasLayer/game1/life_label
@onready var star_label: Label = $CanvasLayer/game1/star_label
@onready var stage_label: Label = $CanvasLayer/game1/stage_label
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var btn_continue: Button = $CanvasLayer/continue
@onready var ui: CanvasLayer = $"../UI"




var stars = 0
var lifes = 0
var stage = 0
var coins = 0


func addStars():
	stars += 1
	print("Estrela adicionada")
	print(stars)
	ui.print_stars(stars)


func addLifes():
	lifes += 1
	ui.print_lifes(lifes)

	
func addCoins():
	coins += 1
	ui.print_coins()

	

var path = "user://path.save"


# var condition = ""

enum Condition { SAVE, LOAD, DELETE }

@export var my_condition: Condition

func setLifes():
	pass


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
	
	var mc = FileAccess.open(path, FileAccess.WRITE)
	mc.store_var(lifes)
	mc.store_var(stars)
	mc.store_var(stage)
	print("Condição save prenchida")
	read_data()

func read_data():
	if FileAccess.file_exists(path):
		var mc = FileAccess.open(path, FileAccess.READ)
		lifes = mc.get_var()
		stars = mc.get_var()
		stage = mc.get_var()
		life_label.text = "Lifes:" + str(lifes)
		star_label.text = "Stars:" + str(stars)
		stage_label.text = "Stage:" + str(stage)
		print("dados carregados")
	else:
		print("no data saved...")

func load_data():
	print("condicao load prenchida")

func delete_data():
	pass


func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/stage_2.tscn")
	
	
################## PARTE 2 DO CODIGO QUE ESTAVA EM UI ##############
