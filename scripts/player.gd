extends CharacterBody2D


var SPEED = 120.0
const JUMP_VELOCITY = -300.0
var count = 0
var hp = 3
var knockback_vector := Vector2.ZERO

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound
@onready var ui: CanvasLayer = $"../UI"
@onready var hurt_sound: AudioStreamPlayer2D = $hurt_sound
@onready var ray_left: RayCast2D = $ray_left
@onready var ray_right: RayCast2D = $ray_right



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
	
	if knockback_vector != Vector2.ZERO :
		velocity = knockback_vector
	
func bounce():
	velocity.y = JUMP_VELOCITY
	

func pre_take_damage():
	if ray_right.is_colliding():
		take_damage(Vector2(-800, -10))
		print("ray direita colidida")
	if ray_left.is_colliding():
		take_damage(Vector2(800, -10))
		print("ray esquerda colidida")

func take_damage(knockback_force := Vector2.ZERO, duration := 0.25):
	print("take_damage chamado")
	hp -= 1
	ui.verificar_hp()
	
	if knockback_force != Vector2.ZERO :
		knockback_vector = knockback_force
		
		var knockback_tween := get_tree().create_tween()
		knockback_tween.tween_property(self, "knockback_vector", Vector2.ZERO, duration)
		animated_sprite_2d.modulate = Color(1,0,0,1)
		knockback_tween.tween_property(animated_sprite_2d, "modulate", Color(1,1,1,1), duration)
		hurt_sound.play()
