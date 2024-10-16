extends CanvasLayer
@onready var resume_btn: Button = $bg_overlay/menu_holder/resume_btn
@onready var quit_btn: Button = $bg_overlay/menu_holder/quit_btn
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var control: Control = $".."

func _ready():
	visible = false
	
func _unhandled_input(event):
	if event.is_action_pressed("start_btn"):
		visible = true
		animation_player.play("pause_game")
		get_tree().paused = true
		resume_btn.grab_focus()


func _on_resume_btn_pressed() -> void:
	get_tree().paused = false
	animation_player.play("resume_game")
	

	visible = false
	
	
func _on_quit_btn_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_reload_btn_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
