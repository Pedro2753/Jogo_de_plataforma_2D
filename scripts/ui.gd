extends CanvasLayer

@onready var coins_ui: Label = $Control/coins_ui
@onready var all_coin_label: Label = $"../Player/Camera2D/all_coin_label"
@onready var message: Label = $Control/message
@onready var game: Node = $GameManger
@onready var data: Control = $data
@onready var lifes_ui: Label = $Control/lifes_ui


func _ready() -> void:
	await get_tree().create_timer(3.0).timeout
	$Control/message.text = ("")
	lifes_ui.text = str(data.lifes)

func show_message(text):  
	$Control/message.text = (text)

func _on_timer_timeout():
	all_coin_label.text = ""
	
func add_coin():
	data.coins += 1
	coins_ui.text = str(data.coins) + "/100" 
	verificar_moedas()

func add_life():
	data.lifes += 1
	lifes_ui.text = str(data.lifes)
	verificar_vidas()

func verificar_moedas():
	if data.coins == 100:
		data.stars += 1
		all_coin_label.text = "Parabéns! Você pegou todas as moedas!"
		data.my_condition = data.Condition.SAVE
		data.exibirTela()
		$Timer.start()

func verificar_vidas():
	if data.lifes == 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
