extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ui: CanvasLayer = $"../UI"
@onready var data: Control = $"../data"
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready():
	animated_sprite_2d.play("default")
	

func _on_body_entered(body):
	animation_player.play("pickup")
	Engine.time_scale = 0.5
	ui.save_ui_stars()
	ui.change_data()
	ui.show_message("Level Completo!")
	await get_tree().create_timer(2.0).timeout
	ui.show_message("")
	ui.visible = false
	Engine.time_scale = 1.0
	# get_tree().change_scene_to_file("res://scenes/stage_2.tscn")
