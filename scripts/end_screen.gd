extends CanvasLayer

@onready var ui: CanvasLayer = $UI
@onready var data: Control = $data

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(7).timeout 
	if data.stars == 21 :
		get_tree().change_scene_to_file("res://scenes/end_screen2.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
