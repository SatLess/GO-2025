extends CharacterBody2D

@export var speed := 150.0
@onready var raycast: Area2D = $Raycast

func _physics_process(delta: float) -> void:
	var direction : Vector2 = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	raycast.rotation = direction.angle() if direction.length() == 1 else raycast.rotation
	velocity = direction * speed
	move_and_slide()
