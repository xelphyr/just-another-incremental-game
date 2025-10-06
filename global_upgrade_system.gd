extends ToolUpgradeSystem

var stats := {
	"coinValue" = 1.0,
	"coinSpawnRate" = 5.0,
	"specialCoinChance" = 0.01,
	"maxCoins" = 5
}

func send_upgrades(data: UpgradeNode) -> void:
	if data:
		match data.id:
			10:
				stats.coinSpawnRate = 5.0 + data.current_level*2
			20:
				stats.coinValue = 1.0 + data.current_level
			30:
				stats.specialCoinChance = 0.01 + data.current_level*0.005
			40:
				stats.maxCoins = 5 + data.current_level*3
	get_tree().call_group("CoinSpawner", "on_update", stats)
