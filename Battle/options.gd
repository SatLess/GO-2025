extends VBoxContainer

var action_list: Array[Button]
signal action_selected

func _ready() -> void:
	for i in get_children():
		if (i is Button):
			action_list.push_back(i)
			i.button_down.connect(func(): action_selected.emit())
	action_list.front().grab_focus.call_deferred()
