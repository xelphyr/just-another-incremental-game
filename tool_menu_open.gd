extends Button

# Called when the node enters the scene tree for the first time.
func _on_toggled(toggled_on:bool) -> void:
	$"../ToolMenu".visible = toggled_on
	if toggled_on:
		Engine.time_scale = 0
	else:
		Engine.time_scale = 1
