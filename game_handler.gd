extends Node

var coins = 0
var tools = []

signal coins_update(amt)

func _ready() -> void:
	emit_signal("coins_update", coins)

func coin_collected(amt) -> void:
	coins += amt
	emit_signal("coins_update", coins)
	
func get_coins() -> float:
	return coins
	
func purchase(amt) -> bool:
	if (amt<=coins):
		coins -= amt
		emit_signal("coins_update", coins)
		return true
	return false
