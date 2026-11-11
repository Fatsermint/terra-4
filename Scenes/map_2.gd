extends Node3D
@onready var bananas: Node3D = $bananas
var finishing = false
@onready var banana: Node3D = $bananas/banana
@onready var player: CharacterBody3D = $"../Player"
var nextBananaLoc = 0
var nextBananaLocMinus = 0
var finishLoc = randi_range(20, 25)
@onready var BananaText: Label = $"../Player/Control/Label"
@onready var BananaUI: Control = $"../Player/Control"

func _ready() -> void:
	player.set_meta("Speed", 9)
	player.set_meta("JumpVelocity", 9)
	player.set_meta("Sensitivity", 0.0025)
	print(finishLoc)
	await showText("Hahaha...   You silly litle bean.. You are stuck here FOREVER >:D")
	await showText("..If you don't find a way out")
	await showText("so get to jumping >:D")
	
	

func _process(delta: float) -> void:
	if player.global_position.x >= finishLoc and not finishing:
		finishing = true	
		await showText("How are you already finished..!?")
		await showText("uurghh..")
		await showText("I guess I can teleport you back")
		await showText("Just a second you ltile bean")
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
		
		
	if player.global_position.x <= finishLoc * -1:
		BananaUI.visible = true
		showText("Heh, you silly bean.. You have been going the wrong way all this time :DD. Silly you   ...")
	if player.global_position.x >= nextBananaLoc-4:
		var bananaClone = banana.duplicate()
		bananas.add_child(bananaClone)
		bananaClone.global_position = Vector3(nextBananaLoc + 4, 0,0)
		nextBananaLoc += 4
	
	if player.global_position.x <= nextBananaLocMinus+4:
		var bananaClone = banana.duplicate()
		bananas.add_child(bananaClone)
		bananaClone.global_position = Vector3(nextBananaLocMinus - 4, 0,0)
		nextBananaLocMinus -= 4

	
	if player.global_position.y <= -10:
		player.global_position = Vector3(0, 4,0)
		showText("Don't jump into void you litle silly bean")
func showText(text):
	BananaUI.visible = true
	BananaText.text = str(text)
	
	var tween = create_tween()
	tween.tween_property($"../Player/Control/Label", "visible_ratio", 1,2)
	await get_tree().create_timer(5).timeout
	BananaText.visible_ratio = 0
	await get_tree().create_timer(0.5).timeout
	
