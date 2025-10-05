extends ToolUpgradeSystem

var stats: Dictionary = {
	"lawnmowerSpeed" = 500,
	"lawnmowerSpawnRate" = 0.2,
	"maxLawnmowers" = 0
}

func send_upgrades(data: UpgradeNode) -> void:
	if data:
		match data.id:
			0: #Add more lawnmowers
				stats.maxLawnmowers = data.current_level * 3
			1: #Increase Lawnmower Speed
				stats.lawnmowerSpeed = 500 + data.current_level * 150
			2: #Increase Lawnmower SpawnRate
				match data.current_level:
					0: 
						stats.lawnmowerSpawnRate = 0.2
					1: 
						stats.lawnmowerSpawnRate = 0.5
					2:
						stats.lawnmowerSpawnRate = 1
					var level:
						stats.lawnmowerSpawnRate = 1 + 0.5*(level - 2)
	get_tree().call_group("LawnmowerSpawner", "on_upgrade", stats)
