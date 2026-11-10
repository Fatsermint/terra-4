extends Node3D
var on = true
@onready var light = $"../Sphere/SpotLight3D"
@onready var light_switch_model = self.get_child(0)
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

	if on:
		light_switch_model.rotation_degrees = Vector3(0,0,0)
	else:
		light_switch_model.rotation_degrees = Vector3(0,0,180)
