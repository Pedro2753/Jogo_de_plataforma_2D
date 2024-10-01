extends CanvasLayer

signal ui_data(new_life, new_stars)

@onready var killzone: Area2D = $"../Killzone"
@onready var stage_ui: Label = $Control/MarginContainer/HBoxContainer/stage_ui
@onready var data: Control = $"../data"
@onready var btn_voltar: Button = $CanvasLayer/btn_voltar
@onready var coins_ui: RichTextLabel = $Control/MarginContainer/HBoxContainer/coins_ui
@onready var stars_ui: RichTextLabel = $Control/MarginContainer/HBoxContainer/stars_ui
@onready var all_coin_label: RichTextLabel = $"../Player/Camera2D/all_coin_label"
@onready var lifes_ui: RichTextLabel = $Control/MarginContainer/HBoxContainer2/lifes_ui
@onready var message: Label = $Control/MarginContainer/message
@onready var player: CharacterBody2D = $"../Player"
@onready var animated_sprite_2d: AnimatedSprite2D = $"../Player/AnimatedSprite2D"
@onready var heart: AnimatedSprite2D = $Control/MarginContainer/HBoxContainer/AnimatedSprite2D



var ui_lifes : int
var ui_stars : int
var stage_stars : int
var ui_stage : int

var coin_icon = "[img=64]res://assets/sprites/coin1.png[/img]"
var life_icon = "[img=128]res://assets/sprites/Avatar-removebg-preview (1).png[/img]"
var star_icon = "[img=64]res://assets/sprites/Star_static.png[/img]"

var load_verify : bool

var coins : int

var ram = "user://ram.save"
var star_ram = "user://star_ram.save"

func saveUi():
	var file = FileAccess.open(ram, FileAccess.WRITE)
	file.store_var(ui_lifes)
	print("dados salvos na ram. Lifes:" + str(ui_lifes))

func save_ui_stars():
	ui_stars += stage_stars
	var file = FileAccess.open(star_ram, FileAccess.WRITE)
	file.store_var(ui_stars)
	print("dados salvos na ram. Stars:" + str(ui_stars))

func loadUi():
	var file = FileAccess.open(ram, FileAccess.READ)
	ui_lifes = file.get_var(ui_lifes)
	print("dados carregados da ram. Lifes:" + str(ui_lifes))

func load_ui_stars():
	var file = FileAccess.open(star_ram, FileAccess.READ)
	ui_stars = file.get_var(ui_stars)
	print("dados caregados da ram. Stars:" + str(ui_stars))

func _ready() -> void:
	await get_tree().create_timer(3.0).timeout
	message.text = ("")
	

func _process(delta):
	lifes_ui.text = str(ui_lifes) + "x" + str(life_icon) 
	stars_ui.text = str(star_icon) + str(stage_stars) + "/3"
	stage_ui.text = "STAGE: " + str(ui_stage)
	coins_ui.text = str(coin_icon) + str(coins) + "/100" 

func show_message(text):  
	message.text = (text)


	
func add_coin():
	coins += 1
	verificar_moedas()

func add_life():
	# data.addLifes()
	ui_lifes += 1
	lifes_ui.text = str(ui_lifes)
	saveUi()
	print("Dados salvos por ui.add_life. Vidas:" + str(ui_lifes))
	emit_signal("life_changed", ui_lifes)
	
func change_data():
	ui_stage += 1
	data.lifes = ui_lifes
	data.stars = ui_stars
	data.stage = ui_stage
	#emit_signal("ui_data", ui_lifes, ui_stars, ui_stage)
	print("sinal chamado")
	data.my_condition = data.Condition.SAVE
	await get_tree().create_timer(2.0).timeout
	data.exibirTela()
	data.btn_next_stage.visible = true
	data.btn_voltar.visible = false
	
func add_star():
	stage_stars += 1
	print("Dados salvos por ui.add_star. Stars:" + str(ui_lifes))

func setStage(new_stage):
	ui_stage = new_stage

func verificar_moedas():
	if coins == 100:
		add_star()
		saveUi()
		all_coin_label.text = "[wave][rainbow][b][center]Parabéns![/center][/b][/rainbow][/wave]"
		await get_tree().create_timer(2).timeout
		all_coin_label.text = "[wave][rainbow][b][center]Você pegou todas as moedas![/center][/b][/rainbow][/wave]"
		await get_tree().create_timer(4).timeout
		all_coin_label.text = "[wave][rainbow][b][center]+1 Estrela[/center][/b][/rainbow][/wave]"
		await get_tree().create_timer(2).timeout
		all_coin_label.text = ""
		# Exibir a tela de data apos a condição ser preenchida
		#data.my_condition = data.Condition.SAVE
		#data.exibirTela()
		$Timer.start()

func verificar_vidas():
	if ui_lifes < 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	else:
		pass

func verificar_hp():
	if player.hp == 3:
		heart.frame = 0
	if player.hp == 2 :
		heart.frame = 1
	if player.hp == 1:
		heart.frame = 2
	if player.hp == 0:
		player.set_physics_process(false)
		player.animated_sprite_2d.play("died")
		await get_tree().create_timer(2).timeout 
		killzone.died()
