extends CanvasLayer

@onready var score_ui: Label = $Control/score_ui
@onready var all_coin_label: Label = $"../Player/Camera2D/all_coin_label"
@onready var message: Label = $Control/message



var score = 0

func _ready() -> void:
	await get_tree().create_timer(3.0).timeout
	$Control/message.text = ("")

func show_message(text):  
	$Control/message.text = (text)

func _on_timer_timeout():
	all_coin_label.text = ""
	
func add_point():
	score += 1
	score_ui.text = str(score) + "/100" 
	verificar()

	
func verificar():
	if score == 100:
		all_coin_label.text = "Parabéns! Você pegou todas as moedas!"
		$Timer.start()
