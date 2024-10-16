extends CharacterBody2D


const JUMP_VELOCITY = -400.0
const SPEED = 40
var direction = 1

# Called when the node enters the scene tree for the first time.
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var all_coin_label: RichTextLabel = $"../Player/Camera2D/all_coin_label"
@onready var ui: CanvasLayer = $"../../UI"
@onready var player: CharacterBody2D = $"../../Player"


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
	









func _on_killzone_body_entered(body: Node2D) -> void:
	player.bounce()
	animation_player.play("death")


func _on_area_2d_body_entered(body: Node2D) -> void:
	player.pre_take_damage()
	print("Colisison detected")
