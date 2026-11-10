extends Node3D
var opened = false

func _on_click():
	if opened:
		$AnimationPlayer.play_backwards("door_open")
		opened = false
	elif opened == false:
		$AnimationPlayer.play("door_open")
		opened = true
func _on_see():
	pass
