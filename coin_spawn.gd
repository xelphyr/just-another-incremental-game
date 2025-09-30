extends Node2D

var coin_scene = preload("res://scenes/coin.tscn")
var MAX_COINS := 5
var spawn_rect

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	var shapes = $SpawnArea.get_children()
	for shape in shapes:
		if shape is CollisionShape2D:
			spawn_rect = shape.shape.get_rect()
			spawn_rect.position += shape.global_position
			print(spawn_rect.position, spawn_rect.end)

func _on_timer_timeout() -> void:
	if $Coins.get_children().size() <= MAX_COINS:
		var coin = coin_scene.instantiate()
		coin.position.x = randf_range(spawn_rect.position.x, spawn_rect.end.x)
		coin.position.y = randf_range(spawn_rect.position.y, spawn_rect.end.y)
		$Coins.add_child(coin)
	
	
