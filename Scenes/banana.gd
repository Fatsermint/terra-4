extends Node3D


func _on_see():
	pass
func _on_clikc():
	pass
	


func _on_htibox_body_entered(body: Node3D) -> void:
	if body.get_meta("Player") == true:
		body.banana_slip()
