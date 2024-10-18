extends Node2D



@onready var texture: Sprite2D = $Sprite2D2
@onready var area_sign: Area2D = $area_sign


const lines : Array[String] = [
	"",
	"You are 2500m away 
	from the top",
]

func _unhandled_input(event: InputEvent) -> void:
	if area_sign.get_overlapping_bodies().size() > 0:
		texture.show()
		if event.is_action_pressed("interact") && !DialogManager.is_message_active:
			texture.hide()
			DialogManager.start_message(Vector2(720, -63), lines)
	else:
		texture.hide()
		if DialogManager.dialog_box != null:
			DialogManager.dialog_box.queue_free()
			DialogManager.is_message_active = false
			
