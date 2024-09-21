extends Area2D


@onready var animation_player = $AnimationPlayer
@onready var ui: CanvasLayer = $"../../UI"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var data: Control = $"../data"


func _ready():
	animated_sprite_2d.play("default")

func _on_body_entered(body):
	data.addCoins()
	animation_player.play("pickup")
