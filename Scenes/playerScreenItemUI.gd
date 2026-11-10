extends Label


@onready var rayCast: RayCast3D = $"../../../RayCast3D"
func _process(delta: float) -> void:
	if rayCast.is_colliding():
		print("colliding with ", rayCast.get_collider())
		
		if rayCast.get_collider().get_parent().get_parent().is_in_group("IntrestingObj"):
			var collider = rayCast.get_collider().get_parent().get_parent()
			self.text = str(collider.get_meta("Name"))
		else:
			self.text = ""
		
