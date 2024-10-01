extends Control

@onready var song: AudioStreamPlayer2D = $song

func _ready():
	Engine.time_scale = 1.0
	song.play()
	await get_tree().create_timer(7.0).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
