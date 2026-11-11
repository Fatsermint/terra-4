extends Node3D
@onready var bananas: Node3D = $bananas

@onready var banana: Node3D = $bananas/banana
@onready var player: CharacterBody3D = $"../Player"
var nextBananaLoc = 0
var nextBananaLocMinus = 0


func _ready() -> void:
	player.set_meta("Speed", 9)
	player.set_meta("JumpVelocity", 9)
	player.set_meta("Sensitivity", 0.0025)
	

func _process(delta: float) -> void:
	if player.global_position.x >= nextBananaLoc-4:
		print("colend")
		var bananaClone = banana.duplicate()
		bananas.add_child(bananaClone)
		bananaClone.global_position = Vector3(nextBananaLoc + 4, 0,0)
		nextBananaLoc += 4
	
	if player.global_position.x <= nextBananaLocMinus+4:
		print("colend")
		var bananaClone = banana.duplicate()
		bananas.add_child(bananaClone)
		bananaClone.global_position = Vector3(nextBananaLocMinus - 4, 0,0)
		nextBananaLocMinus -= 4
	
