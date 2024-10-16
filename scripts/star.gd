extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ui: CanvasLayer = $"../UI"
@onready var all_coin_label: RichTextLabel = $"../Player/Camera2D/all_coin_label"


func _ready():
	animated_sprite_2d.play("default")

func _on_body_entered(body: Node2D) -> void:
	ui.add_star()
	animation_player.play("pickup")
	all_coin_label.text = "[wave][b][center]+1 Star[/center][/b][/wave]"
	await get_tree().create_timer(2).timeout
	all_coin_label.text = ""
