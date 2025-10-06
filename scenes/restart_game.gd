extends Button

func _on_button_up() -> void:
	Engine.time_scale = 1
	GameHandler.coins = 0
	get_tree().reload_current_scene()
