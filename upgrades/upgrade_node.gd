extends Button
class_name UpgradeNode

@export var id: int                            #
@export var title : String                     #
@export var repeatable: bool = false           #
@export var max_level: int = 1                 #
@export var current_level: int = 0
signal on_purchase(data : UpgradeNode)

@export var cost_type: String = "fixed"
@export var base_cost: float = 0.0
@export var mult: float = 1.15
@export var power: float = 2.0

@export var reveal_when: Dictionary = {}
@export var unlock_when: Dictionary = {}
@export var lock_when: Dictionary = {}

func _ready() -> void:
	$Name.text = title
	$Level.text = "(%d/%d)" % [current_level, max_level] 

func cost_at(level: int) -> float:
	if cost_type == "exp":
		return base_cost * pow(mult, level)
	elif cost_type == "poly":
		return base_cost * pow(level, power)
	return base_cost

func _on_button_up() -> void:
	if GameHandler.purchase(cost_at(current_level)):
		current_level += 1
		$Level.text = "(%d/%d)" % [current_level, max_level] 
		emit_signal("on_purchase", self)
		
		
		
