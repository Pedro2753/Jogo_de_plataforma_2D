extends Area2D

@onready var player: CharacterBody2D = $"../../Player"




func _on_body_entered(body: Node2D) -> void:
	player.take_damage(Vector2(-800, -100))
	print("colission detected")
