extends Node2D

var coin_scene = preload("res://scenes/coin.tscn")
var max_coins := 5
var coin_value := 1
var spawn_rect

# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_update(stats: Dictionary) -> void:
	$Timer.wait_time = 1/stats.coinSpawnRate
	max_coins = stats.maxCoins
	coin_value = stats.coinValue

func _ready() -> void:
	var shapes = get_children()
	for shape in shapes:
		if shape is CollisionShape2D:
			spawn_rect = shape.shape.get_rect()
			spawn_rect.position += shape.global_position

func _on_timer_timeout() -> void:
	if $Coins.get_children().size() < max_coins:
		var coin = coin_scene.instantiate()
		coin.position.x = randf_range(spawn_rect.position.x, spawn_rect.end.x)
		coin.position.y = randf_range(spawn_rect.position.y, spawn_rect.end.y)
		coin.value = coin_value
		$Coins.add_child(coin)
	
	
