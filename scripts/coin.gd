extends Area2D


@onready var animation_player = $AnimationPlayer
@onready var ui: CanvasLayer = $"../../UI"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D



func _ready():
	animated_sprite_2d.play("default")

func _on_body_entered(body):
	ui.add_coin()
	animation_player.play("pickup")
