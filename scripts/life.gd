extends Area2D


@onready var ui: CanvasLayer = $"../../UI"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer



# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite_2d.play("default")


func _on_body_entered(body):
	print("colisão detectada")
	ui.add_life()
	animation_player.play("pickup")
