extends CharacterBody2D


const SPEED = 300.0



func _physics_process(delta: float) -> void:
	# Add the gravity.

	# Handle jump.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x := Input.get_axis("left", "right")
	var direction_y := Input.get_axis("up", "down")
	var moveDirection := Vector2(direction_x, direction_y).normalized()
	
	velocity = moveDirection*SPEED

	move_and_slide()
