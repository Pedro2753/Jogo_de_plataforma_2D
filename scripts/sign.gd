extends Node2D



@onready var label: Label = $"../Sign/Label"
@onready var label2: Label = $"../Sign2/Label"
@onready var label3: Label = $"../Sign3/Label"






func _on_body_entered(body: Node2D) -> void:
	label.text = "Montanha da singularidade logo a frente" 
	label2.text = "Cuidado, montanha singular" 
	label3.text = "Sem possivel retorno a partir dos 100m"
	


func _on_body_exited(body: Node2D) -> void:
	label.text = "" 
	label2.text = "" 
	label3.text = ""
