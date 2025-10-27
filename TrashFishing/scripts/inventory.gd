class_name Inventory extends Node

# TODO Export items to Item Resource at some point
@onready var inventory = {
	"Glass": 0
}

# Signals
signal inventory_updated

func add_item_to_inventory(item_name: String, amount: int = 1):
	inventory[item_name] += amount
	inventory_updated.emit()
