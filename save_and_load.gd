extends Node2D

var save_path = "user://variable.save"

var variable1 = 0
var variable2 = 0
var variable3 = 0

var text1
var text2
var text3

func _ready():
	text1 = $Variable_1/text_1
	text2 = $Variable_2/text_2
	text3 = $Variable_3/text_3

func _process(delta):
	text1.text = str(variable1)
	text2.text = str(variable2)
	text3.text = str(variable3)

### BUTTONS FOR VAR 1 ###
func _on_minus_1_pressed() -> void:
	variable1 -= 1
func _on_plus_1_pressed() -> void:
	variable1 += 1

### BUTTONS FOR VAR 2 ###
func _on_minus_2_pressed() -> void:
	variable2 -= 1
func _on_plus_2_pressed() -> void:
	variable2 += 1
	
### BUTTONS FOR VAR 3 ###
func _on_minus_3_pressed() -> void:
	variable3 -= 1
func _on_plus_3_pressed() -> void:
	variable3 += 1


func _on_save_button_pressed() -> void:
	save()
	
func _on_load_button_pressed() -> void:
	load_data()

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(variable1)
	file.store_var(variable2)
	file.store_var(variable3)

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		variable1 = file.get_var(variable1)
		variable2 = file.get_var(variable2)
		variable3 = file.get_var(variable3)
	else:
		print("no data saved...")
		variable1 = 0
		variable2 = 0
		variable3 = 0 
