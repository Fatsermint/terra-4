extends Node3D

const PLAYER = preload("uid://yg4puxho81q7")

func _on_see():
	pass
	
func _on_click():
	PLAYER.wake_up()
