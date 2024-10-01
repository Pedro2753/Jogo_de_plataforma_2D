extends CharacterBody2D

const SPEED = 40
var direction = 1

# Called when the node enters the scene tree for the first time.
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player: CharacterBody2D = $"../../Player"
@onready var all_coin_label: RichTextLabel = $"../../Player/Camera2D/all_coin_label"
@onready var ui: CanvasLayer = $"../../UI"
@onready var chicken_sound: AudioStreamPlayer2D = $chicken_sound



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	
	position.x += direction * SPEED * delta


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	chicken_sound.play()
