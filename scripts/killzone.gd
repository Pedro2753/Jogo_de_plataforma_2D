extends Area2D

@onready var timer: Timer = $Timer
@onready var data: Control = $data
@onready var hud: CanvasLayer = $HUD








func _on_body_entered(body: Node2D) -> void:
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	# A linha abaixo Recarrega a cena atual 
	get_tree().reload_current_scene()
	data.setLifes()
	
