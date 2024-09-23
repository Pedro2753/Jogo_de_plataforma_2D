extends Control

@onready var game: Node = $GameManger
@onready var life_label: Label = $CanvasLayer/game1/life_label
@onready var star_label: Label = $CanvasLayer/game1/star_label
@onready var stage_label: Label = $CanvasLayer/game1/stage_label
@onready var game_1: Button = $CanvasLayer/game1
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var ui: CanvasLayer = $"../UI"
@onready var btn_next_stage: Button = $CanvasLayer/btn_next_stage
@onready var btn_voltar: Button = $CanvasLayer/btn_voltar
@onready var main_menu: Control = $"../../main_menu"

var is_on_menu : bool

signal fechar_menu



signal data_ui(new_life, new_stars)

var stars : int
var lifes : int
var stage : int

var lb_stars 
var lb_lifes
var lb_stage

func setStar():
	stars =+ 1
	print("Estrela adicionada")
	print(stars)

func addLifes():
	lifes += 1

var mc_path = "user://mc_path.save"

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
	
	"""
	if condition == "save":
		save_data()
	elif condition == "load":
		load_data()
		#script para carregar os dados
	elif condition
	"""

func save_data():
	var mc = FileAccess.open(mc_path, FileAccess.WRITE)
	mc.store_var(lifes)
	mc.store_var(stars)
	mc.store_var(stage)
	life_label.text = "Lifes:" + str(lifes)
	star_label.text = "Stars:" + str(stars)
	stage_label.text = "Stage:" + str(stage)
	print("Condição save prenchida")

func read_data():
	if FileAccess.file_exists(mc_path):
		var mc = FileAccess.open(mc_path, FileAccess.READ)
		lb_lifes = mc.get_var(lifes)
		lb_stars = mc.get_var(stars)
		lb_stage = mc.get_var(stage)
		life_label.text = "Lifes:" + str(lb_lifes)
		star_label.text = "Stars:" + str(lb_stars)
		stage_label.text = "Stage:" + str(lb_stage)
		print("dados carregados")
	else:
		print("no data saved...")

func load_data():
	if lb_stage > 1:
		lifes = lb_lifes 
		stars = lb_stars 
		stage = lb_stage 
		var actual_stage = str("res://scenes/stage_"+str(stage)+".tscn")
		if FileAccess.file_exists(mc_path):
			var mc = FileAccess.open(mc_path, FileAccess.READ)
			lifes = mc.get_var(lifes)
			stars = mc.get_var(stars)
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
	get_tree().change_scene_to_file(str(actual_stage))


func _on_btn_voltar_pressed() -> void:
	canvas_layer.visible = false
	main_menu.button.visible = true
	main_menu.button_2.visible = true
	main_menu.button_3.visible = true
