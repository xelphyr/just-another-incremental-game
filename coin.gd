extends Area2D

var value := 1

func _on_body_entered(body):
	if body.is_in_group("Collector"):
		GameHandler.coin_collected(value)
		queue_free()
