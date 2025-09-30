extends Node

var coins = 0

signal coins_update(amt)

func coin_collected(amt) -> void:
	print(amt, coins)
	coins += amt
	emit_signal("coins_update", coins)
	
func get_coins() -> float:
	return coins
