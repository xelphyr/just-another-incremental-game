extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale = 0
	var uis = get_parent().get_children()
	for ui in uis:
		if ui.name != "GameOver":
			ui.visible = false
	
