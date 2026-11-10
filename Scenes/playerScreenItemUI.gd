extends Label


@onready var rayCast: RayCast3D = $"../../../RayCast3D"
func _process(delta: float) -> void:
	if rayCast.is_colliding():
		
		if rayCast.get_collider().get_parent().get_parent().is_in_group("IntrestingObj"):
			var collider = rayCast.get_collider().get_parent().get_parent()
			self.text = str(collider.get_meta("Name"))
			if not collider.get_script() == null:
				collider._on_see()
				if Input.is_action_just_pressed("do"):
					collider._on_click()
		else:
			self.text = ""
	else:
		self.text = ""
