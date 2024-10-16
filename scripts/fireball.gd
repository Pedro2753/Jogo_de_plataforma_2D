extends Area2D

var move_speed := 50.0
var direction := 1
@onready var player: CharacterBody2D = $"../../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += move_speed * direction * delta
	
func set_direction(dir):
	direction = dir
	if dir < 0:
		$anim.flip_h = true
	else:
		$anim.flip_h = false


func _on_body_entered(body: Node2D) -> void:
	player.pre_take_damage()
	print("fireball detected")
	await get_tree().create_timer(0.1).timeout
	queue_free()
