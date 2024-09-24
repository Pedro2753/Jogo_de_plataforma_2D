extends CharacterBody2D


var SPEED = 120.0
const JUMP_VELOCITY = -300.0
var count = 0

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		count = 0
		velocity.y = JUMP_VELOCITY
		jump_sound.play()
	# Handle Double Jump
	if count == 0:
		if Input.is_action_just_pressed("jump") and not is_on_floor():
			count = + 1
			velocity.y = JUMP_VELOCITY
			jump_sound.play()
	# Run
	if Input.is_action_just_pressed("run") and is_on_floor():
		SPEED = 200
		animated_sprite_2d.play("run")
	if Input.is_action_just_released("run") : 
		SPEED = 120
		animated_sprite_2d.play("walk")
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	#Flip the sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true

	#Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("jump")
	
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func bounce():
	velocity.y = JUMP_VELOCITY
