extends Control



@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var ui: CanvasLayer = $"../UI"
@onready var main_menu: Control = $"../../main_menu"
@export var game: Node
@export var stage_label: Node 
@export var life_label: Node
@export var star_label: Node
@export var game_2: Node
@export var star_label_2: Node
@export var stage_label_2: Node
@export var life_label_2: Node
@export var game_3: Node
@export var stage_label_3: Node
@export var life_label_3: Node
@export var star_label_3: Node
@export var btn_voltar: Node
@export var btn_next_stage: Node
@export var animation: Node

var is_on_menu : bool

signal fechar_menu



signal data_ui(new_life, new_stars)

var stars : int
var lifes : int
var stage : int

var mc
var mc2
var mc3

var lb_stars 
var lb_lifes
var lb_stage

var lb_stars2 
var lb_lifes2
var lb_stage2

var lb_stars3 
var lb_lifes3
var lb_stage3

func setStar():
	stars =+ 1
	print("Estrela adicionada")
	print(stars)

func addLifes():
	lifes += 1

var mem_card = "user://mem_card.save"
var mem_card2 = "user://mem_card2.save"
var mem_card3 = "user://mem_card3.save"


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
	animation.play("show_menu")
	get_tree().paused = true
	read_data()
	canvas_layer.visible = true
	print("Tela Exibida")
	if is_on_menu == true:
		main_menu.button.visible = false
		main_menu.button_2.visible = false
		main_menu.button_3.visible = false


func _on_game_1_pressed() -> void:
	match my_condition:
		Condition.SAVE:
			save_data()
		Condition.LOAD:
			load_data()
		Condition.DELETE:
			delete_data()

func _on_game_2_pressed() -> void:
	match my_condition:
		Condition.SAVE:
			save_data2()
		Condition.LOAD:
			load_data2()
		Condition.DELETE:
			delete_data()


func _on_game_3_pressed() -> void:
	match my_condition:
		Condition.SAVE:
			save_data3()
		Condition.LOAD:
			load_data3()
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
	var file = FileAccess.open(mem_card, FileAccess.WRITE)
	file.store_var(lifes)
	file.store_var(stars)
	file.store_var(stage)
	life_label.text = "Lifes:" + str(lifes)
	star_label.text = "Stars:" + str(stars)
	stage_label.text = "Stage:" + str(stage)
	print("Condição save prenchida")

func save_data2():
	var file = FileAccess.open(mem_card2, FileAccess.WRITE)
	file.store_var(lifes)
	file.store_var(stars)
	file.store_var(stage)
	life_label_2.text = "Lifes:" + str(lifes)
	star_label_2.text = "Stars:" + str(stars)
	stage_label_2.text = "Stage:" + str(stage)
	print("Condição save prenchida")


func save_data3():
	var file = FileAccess.open(mem_card3, FileAccess.WRITE)
	file.store_var(lifes)
	file.store_var(stars)
	file.store_var(stage)
	life_label_3.text = "Lifes:" + str(lifes)
	star_label_3.text = "Stars:" + str(stars)
	stage_label_3.text = "Stage:" + str(stage)
	print("Condição save prenchida")


func read_data():
	if FileAccess.file_exists(mem_card):
		var file = FileAccess.open(mem_card, FileAccess.READ)
		lb_lifes = file.get_var(lifes)
		lb_stars = file.get_var(stars)
		lb_stage = file.get_var(stage)
		life_label.text = "X" + str(lb_lifes)
		star_label.text = "X" + str(lb_stars)
		stage_label.text = "Stage:" + str(lb_stage)
		print("dados carregados")
	else:
		print("no data saved...")
	if FileAccess.file_exists(mem_card2):
		var file = FileAccess.open(mem_card2, FileAccess.READ)
		lb_lifes2 = file.get_var(lifes)
		lb_stars2 = file.get_var(stars)
		lb_stage2 = file.get_var(stage)
		life_label_2.text = "X" + str(lb_lifes2)
		star_label_2.text = "X" + str(lb_stars2)
		stage_label_2.text = "Stage:" + str(lb_stage2)
		print("dados carregados")
	else:
		print("no data saved...")
	if FileAccess.file_exists(mem_card3):
		var file = FileAccess.open(mem_card3, FileAccess.READ)
		lb_lifes3 = file.get_var(lifes)
		lb_stars3 = file.get_var(stars)
		lb_stage3 = file.get_var(stage)
		life_label_3.text = "X" + str(lb_lifes3)
		star_label_3.text = "X" + str(lb_stars3)
		stage_label_3.text = "Stage:" + str(lb_stage3)
		print("dados carregados")
	else:
		print("no data saved...")

func load_data():
	if lb_stage > 1:
		lifes = lb_lifes 
		stars = lb_stars 
		stage = lb_stage 
		var actual_stage = str("res://scenes/stage_"+str(stage)+".tscn")
		if FileAccess.file_exists(mem_card):
			var file = FileAccess.open(mem_card, FileAccess.READ)
			lifes = file.get_var(lifes)
			stars = file.get_var(stars)
			ui.ui_lifes = lifes
			ui.ui_stars = stars
	
			ui.saveUi()
			ui.save_ui_stars()
			get_tree().change_scene_to_file(str(actual_stage))
			ui.lifes_ui.text = str(lifes)
			ui.stars_ui.text = str(stars)
			is_on_menu = false
			print("dados carregados")
		else:
			print("no data saved...")
	else:
		print("no data saved...")
	print("condicao load prenchida")

func load_data2():
	if lb_stage > 1:
		lifes = lb_lifes2 
		stars = lb_stars2 
		stage = lb_stage2 
		var actual_stage = str("res://scenes/stage_"+str(stage)+".tscn")
		if FileAccess.file_exists(mem_card2):
			var file = FileAccess.open(mem_card2, FileAccess.READ)
			lifes = file.get_var(lifes)
			stars = file.get_var(stars)
			ui.ui_lifes = lifes
			ui.ui_stars = stars
	
			ui.saveUi()
			ui.save_ui_stars()
			get_tree().change_scene_to_file(str(actual_stage))
			ui.lifes_ui.text = str(lifes)
			ui.stars_ui.text = str(stars)
			is_on_menu = false
			print("dados carregados")
		else:
			print("no data saved...")
	else:
		print("no data saved...")
	print("condicao load prenchida")

func load_data3():
	if lb_stage > 1:
		lifes = lb_lifes3 
		stars = lb_stars3 
		stage = lb_stage3 
		var actual_stage = str("res://scenes/stage_"+str(stage)+".tscn")
		if FileAccess.file_exists(mem_card3):
			var file = FileAccess.open(mem_card3, FileAccess.READ)
			lifes = file.get_var(lifes)
			stars = file.get_var(stars)
			ui.ui_lifes = lifes
			ui.ui_stars = stars
	
			ui.saveUi()
			ui.save_ui_stars()
			get_tree().change_scene_to_file(str(actual_stage))
			ui.lifes_ui.text = str(lifes)
			ui.stars_ui.text = str(stars)
			is_on_menu = false
			print("dados carregados")
		else:
			print("no data saved...")
	else:
		print("no data saved...")
	print("condicao load prenchida")

func delete_data():
	pass


func _on_ui_ui_data(new_life: Variant, new_stars: Variant, new_stage: Variant) -> void:
	lifes = new_life
	stars = new_stars
	stage = new_stage
	print("dados trocados")
	print("lifes:"+str(lifes))
	print("stars:"+str(stars))
	print("stage:"+str(stage))
	my_condition = Condition.SAVE
	await get_tree().create_timer(4.0).timeout
	exibirTela()


func _on_btn_next_stage_pressed() -> void:
	var actual_stage = str("res://scenes/stage_"+str(stage)+".tscn")
	get_tree().paused = false
	get_tree().change_scene_to_file(str(actual_stage))
	ui.visible = true




func _on_btn_voltar_pressed() -> void:
	get_tree().paused = false
	canvas_layer.visible = false
	main_menu.button.visible = true
	main_menu.button_2.visible = true
	main_menu.button_3.visible = true
