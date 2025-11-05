class_name Interactable
extends Area2D

var is_interactable := false
var interact: Callable

func _on_area_entered(area: Area2D) -> void:
	is_interactable = true

func _on_area_exited(area: Area2D) -> void:
	is_interactable = false

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") and is_interactable:
		assert(interact, "interact is not set")
		interact.call()
