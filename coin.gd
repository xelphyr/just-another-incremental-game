extends Area2D

var value := 1

func _on_body_entered(body):
	if body.name == "Player":
		GameHandler.coin_collected(value)
		queue_free()
