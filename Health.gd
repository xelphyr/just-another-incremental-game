extends Node
class_name Health

@export var max_health := 5
@export var healing_factor:= 0.5
@onready var health = max_health
var game_over = preload("res://scenes/GameOver.tscn")

var can_be_damaged = true

func _process(delta: float) -> void:
	health = min(max_health, health+healing_factor*delta) 
	$"../../CanvasLayer/HealthUI".value = health



func on_damage(damage) -> void:
	if can_be_damaged:
		if health-damage <= 0:
			$"../../CanvasLayer/HealthUI".value = 0
			var go = game_over.instantiate()
			$"../../CanvasLayer".add_child(go)
			get_parent().queue_free()
		else:
			health -= damage
			$Timer.start()
			can_be_damaged = false
	
func _on_timer_timeout() -> void:
	can_be_damaged = true
