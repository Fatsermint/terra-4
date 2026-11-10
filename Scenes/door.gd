extends Node3D
var opened = false

func _on_click():
	if opened:
		$AnimationPlayer.play_backwards(self.get_meta("Animation"))
		opened = false
	elif opened == false:
		$AnimationPlayer.play(self.get_meta("Animation"))
		opened = true
func _on_see():
	pass
