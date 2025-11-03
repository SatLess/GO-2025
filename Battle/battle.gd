#TODO talvez essa propria clase deveria ser jogada pra outro node
extends Control

#TODO talvez eventualmente separe isso pra uma classe só, mas agora nao vale a pena
@export var protags: Array[Actor]
@export var troops: Array[Actor]

var start_protag: bool = true

func _waitProtagAction():
	for i in range(protags.size()):
		await $BoxContainer/Options.action_selected
		print("Eu selecionei")

func _troopsAction():
	pass

func startBattle():
	if start_protag:
		_waitProtagAction()

func  _ready() -> void:
	startBattle()
