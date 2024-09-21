extends Area2D

@onready var timer: Timer = $Timer
@onready var data: Control = $data
@onready var ui: CanvasLayer = $UI

var life_ram = "user://life_ram.save"


func _on_body_entered(body: Node2D) -> void:
<<<<<<< HEAD
	data.lifes -= 1
=======
	var file = FileAccess.open(life_ram, FileAccess.READ)
	ui.ui_lifes = file.get_var(ui.ui_lifes)
	ui.ui_lifes -= 1
>>>>>>> parent of eabd3f0 (20/09)
	ui.verificar_vidas()
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	print("Dados salvos por killzone _entered. Vidas:" + str(ui.ui_lifes))
	


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	# A linha abaixo Recarrega a cena atual 
	get_tree().reload_current_scene()
	
	
