extends Node2D

@export var spawnpoints : Array[Node2D]= []
var lawnmowerscene = preload("res://tools/lawnmower/Lawnmower.tscn")

#Tool Properties
var lawnmowerSpeed := 500
var maxLawnmowers := 0

func on_upgrade(upgrades:Dictionary) -> void:
	lawnmowerSpeed = upgrades["lawnmowerSpeed"]
	$SpawnTimer.wait_time = 1/upgrades["lawnmowerSpawnRate"]
	maxLawnmowers = upgrades["maxLawnmowers"]

func _on_spawn_timer_timeout() -> void:
	if $Lawnmowers.get_child_count() < maxLawnmowers:
		var rand_spawnpoint = spawnpoints[randi_range(0,4)]
		var lawnmower = lawnmowerscene.instantiate()
		lawnmower.position = rand_spawnpoint.position
		lawnmower.speed = lawnmowerSpeed
		$Lawnmowers.add_child(lawnmower, true)
	
