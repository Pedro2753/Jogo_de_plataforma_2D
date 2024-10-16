extends CharacterBody2D


const JUMP_VELOCITY = -400.0
const SPEED = 40
var direction = 1
var hp = 2

# Called when the node enters the scene tree for the first time.
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player: CharacterBody2D = $"../../Player"
@onready var all_coin_label: RichTextLabel = $"../../Player/Camera2D/all_coin_label"
@onready var ui: CanvasLayer = $"../../UI"
@onready var death_sound: AudioStreamPlayer2D = $DeathSound


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta




	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.


	move_and_slide()

func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	
	position.x += direction * SPEED * delta
	



func _on_damage_zone_body_entered(body: Node2D) -> void:
	player.bounce()
	var knockback_tween := get_tree().create_tween()
	var duration := 0.25
	animated_sprite.modulate = Color(1,0,0,1)
	knockback_tween.tween_property(animated_sprite, "modulate", Color(1,1,1,1), duration)
	death_sound.play()
	fucking_dies()

func fucking_dies():
	hp -=1
	if hp == 0:
		animation_player.play("death")

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	player.pre_take_damage()
	print("Colisison detected")
