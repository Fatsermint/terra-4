extends Node3D
var on = true
@onready var light = $"../Sphere/SpotLight3D"
func _on_see():
	pass
func _on_click():
	print("A")
	if on:
		light.visible = false
		on = false
	else:
		light.visible = true
		on = true
		
