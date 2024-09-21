extends CanvasLayer

@onready var coins_ui: Label = $Control/coins_ui
@onready var all_coin_label: Label = $"../Player/Camera2D/all_coin_label"
@onready var message: Label = $Control/message
@onready var data: Control = $data
@onready var pv: Node = $player_variables
@onready var stars_ui: Label = $Control/stars_ui
@onready var lifes_ui: Label = $Control/lifeUi





<<<<<<< HEAD
var ui_lifes = 3
var ui_stars = 0
var ui_stages = 0
var ui_coins : int
=======
var ui_lifes : int
var ui_stars = 1


var coins : int

var life_ram = "user://life_ram.save"
var star_ram = "user://star_ram.save"

func saveUi():
	var file = FileAccess.open(life_ram, FileAccess.WRITE)
	file.store_var(ui_lifes)
	print("dados salvos na ram. Lifes:" + str(ui_lifes))

func save_ui_stars():
	var file = FileAccess.open(star_ram, FileAccess.WRITE)
	file.store_var(ui_stars)
	print("dados salvos na ram. Stars:" + str(ui_stars))

func loadUi():
	var file = FileAccess.open(life_ram, FileAccess.READ)
	ui_lifes = file.get_var(ui_lifes)
	print("dados carregados da ram. Lifes:" + str(ui_lifes))

func load_ui_stars():
	var file = FileAccess.open(star_ram, FileAccess.WRITE)
	file.store_var(ui_stars)
	print("dados salvos na ram. Stars:" + str(ui_stars))
>>>>>>> parent of eabd3f0 (20/09)

func _ready() -> void:

	await get_tree().create_timer(3.0).timeout
	$Control/message.text = ("")
	


func _process(delta):
		lifes_ui.text = str(ui_lifes)
		stars_ui.text = str(ui_stars)


func show_message(text):  
	$Control/message.text = (text)

func _on_timer_timeout():
	all_coin_label.text = ""
	
func print_coins():
	ui_coins += 1 
	coins_ui.text = str(ui_coins) + "/100" 
	verificar_moedas()

func print_lifes(value):
	ui_lifes += value
	print("Dados salvos por ui.add_life. Vidas:" + str(ui_lifes))

<<<<<<< HEAD

func print_stars(value):
	ui_stars = value
	stars_ui.text += str(ui_stars)
	print("Dados salvos por ui.add_star. Stars:" + str(ui_stars))

func verificar_moedas():
	if ui_coins == 100:
		data.stars =+ 1
=======
func add_star():
	ui_stars += 1
	saveUi()
	print("Dados salvos por ui.add_star. Stars:" + str(ui_lifes))

func verificar_moedas():
	if coins == 1:
		add_star()
		saveUi()
>>>>>>> parent of eabd3f0 (20/09)
		all_coin_label.text = "Parabéns! Você pegou todas as moedas!"
		data.my_condition = data.Condition.SAVE
		data.exibirTela()
		$Timer.start()

func verificar_vidas():
	if ui_lifes < 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	else:
		pass
