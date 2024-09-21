extends CanvasLayer

@onready var coins_ui: Label = $Control/coins_ui
@onready var all_coin_label: Label = $"../Player/Camera2D/all_coin_label"
@onready var message: Label = $Control/message
@onready var data: Control = $data
@onready var pv: Node = $player_variables
@onready var stars_ui: Label = $Control/stars_ui
@onready var lifes_ui: Label = $Control/lifeUi





var ui_lifes = 3
var ui_stars = 0
var ui_stages = 0
var ui_coins : int

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


func print_stars(value):
	ui_stars = value
	stars_ui.text += str(ui_stars)
	print("Dados salvos por ui.add_star. Stars:" + str(ui_stars))

func verificar_moedas():
	if ui_coins == 100:
		data.stars =+ 1
		all_coin_label.text = "Parabéns! Você pegou todas as moedas!"
		# Exibir a tela de data apos a condição ser preenchida
		#data.my_condition = data.Condition.SAVE
		#data.exibirTela()
		$Timer.start()

func verificar_vidas():
	if ui_lifes < 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	else:
		pass
