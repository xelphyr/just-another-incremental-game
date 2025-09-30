extends Label

func _ready() -> void:
	GameHandler.coins_update.connect(_on_coin_collected)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_coin_collected(amt : float) -> void:
	print("Signal Received!")
	text = "🪙: " + str(amt) + "$"
