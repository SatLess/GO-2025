class_name DialogueBox
extends ColorRect

@onready var label: RichTextLabel = $RichTextLabel
@export var current_lines: Array[String]
static var instance: DialogueBox # Mimic Singleton Without making the Ui one and using getter there
var idx := 0
var finished := true

## Parses Dialogue Keys
func set_dialogue(dialogue_path: String):
	#TODO parse path and etc
	pass

func startDialogue(dialogue_path: String):
	finished = false
	show()
	_advanceDialogue()

func _endDialogue():
	finished = true
	idx = 0
	current_lines.clear()
	hide()

func _advanceDialogue():
	if idx >= current_lines.size():
		_endDialogue()
		return
	label.text = current_lines[idx]
	idx += 1

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept") and not finished:
		_advanceDialogue()
		get_viewport().set_input_as_handled()

func _init() -> void:
	instance = self
