extends Control
class_name ToolUpgradeSystem

@export var nodes: Array[UpgradeNode] = []




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_recalculate_upgrade_tree(null)

func _recalculate_upgrade_tree(data: UpgradeNode) -> void:
	var nodes_to_hide: Array[UpgradeNode] = []
	var nodes_to_lock: Array[UpgradeNode] = []
	var nodes_to_unlock: Array[UpgradeNode] = []
	
	for node in nodes:
		var invisible := false
		var locked := false
		
		for reqnode in node.reveal_when.keys():
			if nodes[reqnode].current_level < node.reveal_when[reqnode]:
				invisible = true
				break
				
		if not invisible:
			for unlocknode in node.unlock_when.keys():
				if nodes[unlocknode].current_level < node.unlock_when[unlocknode]: # below unlock threshold
					locked = true
					break
			if not locked:
				for locknode in node.lock_when.keys():
					if nodes[locknode].current_level >= node.lock_when[locknode]: # above lock threshold
						locked = true
						break

		
		if invisible:
			nodes_to_hide.append(node)
		elif locked:
			nodes_to_lock.append(node)
		else:
			nodes_to_unlock.append(node)
			
	for node in nodes_to_hide:
		node.disabled = true
		node.visible = false
	for node in nodes_to_lock:
		node.disabled = true
		node.visible = true
	for node in nodes_to_unlock:
		node.disabled = false
		node.visible = true
