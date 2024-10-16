extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ui: CanvasLayer = $"../UI"
@onready var data: Control = $"../data"
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var stage = 1

func _ready():
	animated_sprite_2d.play("default")
	

func _on_body_entered(body):
	stage =+ 1
	animation_player.play("pickup")
	Engine.time_scale = 0.5
	ui.save_ui_stars()
	ui.show_message("Stage Completed!")
	await get_tree().create_timer(2.0).timeout
	ui.show_message("")
	Engine.time_scale = 1.0
	ui.stage_stars = 0
	ui.change_data()
