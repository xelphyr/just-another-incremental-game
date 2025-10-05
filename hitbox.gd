extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		for i in body.get_children():
			if i is Health:
				i.on_damage(1)
