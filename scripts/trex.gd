extends CharacterBody2D


var move_speed := 50.0
var direction = 1
var hp := 3
const FIREBALL = preload("res://scenes/fireball.tscn")

@onready var sprite: Sprite2D = $sprite
@onready var anim: AnimationPlayer = $anim
@onready var fireball_spawn_point: Marker2D = $fireball_spawn_point
@onready var ground_detector: RayCast2D = $ground_detector
@onready var player_detected: RayCast2D = $player_detected
@onready var hurt_sound: AudioStreamPlayer2D = $hurt_sound
@onready var player: CharacterBody2D = $"../../Player"

@export var target : CharacterBody2D
enum EnemyState {PATROL, ATTACK, HURT}
var current_state = EnemyState.PATROL




func _ready():
	pass


func _physics_process(delta: float) -> void:
	match(current_state):
		EnemyState.PATROL : patrol_state()
		EnemyState.ATTACK : attack_state()
	
func flip_enemy():
	direction *= -1
	sprite.scale.x *= -1
	player_detected.scale.x *= -1
	fireball_spawn_point.position.x *= -1

func spawn_fireball():
	var new_fireball = FIREBALL.instantiate()
	if sign(fireball_spawn_point.position.x) == 1:
		new_fireball.set_direction(1)
	else:
		new_fireball.set_direction(-1)
	add_sibling(new_fireball)
	new_fireball.global_position = fireball_spawn_point.global_position

func _change_state(state):
	current_state = state
	
func patrol_state():
	anim.play("running")
	if is_on_wall():
		flip_enemy()
	if not ground_detector.is_colliding():
		flip_enemy()
	velocity.x = move_speed * direction

	if player_detected.is_colliding():
		_change_state(EnemyState.ATTACK)
	
	move_and_slide()
	
func attack_state():
	anim.play("shooting")
	if not player_detected.is_colliding():
		_change_state(EnemyState.PATROL)

func hurt_state():
	anim.play("hurt")
	hurt_sound.play()
	var hurt_tween := get_tree().create_tween()
	var duration := 0.25
	sprite.modulate = Color(1,0,0,1)
	hurt_tween.tween_property(sprite, "modulate", Color(1,1,1,1), duration)
	await get_tree().create_timer(0.3).timeout
	_change_state(EnemyState.PATROL)
	if hp > 0:
		hp -= 1
	else:
		queue_free()

func _on_do_damege_body_entered(body: Node2D) -> void:
	player.pre_take_damage()
	print("Colisison detected")


func _on_take_damage_body_entered(body: Node2D) -> void:
	player.bounce()
	_change_state(EnemyState.HURT)
	hurt_state()
