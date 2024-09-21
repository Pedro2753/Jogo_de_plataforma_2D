extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ui: CanvasLayer = $"../UI"
@onready var data: Control = $"../data"


func _ready():
	animated_sprite_2d.play("default")

func _on_body_entered(body: Node2D) -> void:
	data.addStars()
	animation_player.play("pickup")
