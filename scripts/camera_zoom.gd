extends Area2D

@onready var animation_player: AnimationPlayer = $"../camera_zoom/AnimationPlayer"
@onready var collision_shape_2d_2: CollisionShape2D = $camera_zoom/CollisionShape2D2
@onready var player: CharacterBody2D = $"../Player"
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer






func _on_body_entered(body: Node2D) -> void:
	
	animation_player.play("zoom_out")
	print("animação tocada")
	audio.stop()

func _on_body_exited(body: Node2D) -> void:
	animation_player.play("zoom_in")
	print("animação tocada")
	audio.play()
	
