extends AnimatableBody2D

var speed = 5;

func _process(delta: float) -> void:    
	position.x += speed*delta
