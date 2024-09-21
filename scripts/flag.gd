extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ui: CanvasLayer = $"../UI"
@onready var data: Control = $data




func _ready():
	animated_sprite_2d.play("default")
	

func _on_body_entered(body):
	Engine.time_scale = 0.5
	data.stage +=  1        
	data.addStars()  
	ui.show_message("Level Completo!")
	await get_tree().create_timer(2.0).timeout
	ui.show_message("+ 1 Estrela") 
	await get_tree().create_timer(2.0).timeout
	Engine.time_scale = 1.0
	ui.save_ui_stars()
	data.my_condition = data.Condition.SAVE
	data.exibirTela()
