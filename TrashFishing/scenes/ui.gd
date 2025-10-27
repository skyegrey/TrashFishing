class_name UI extends Control

# Scene Refs
@onready var player_node = %PlayerNode
@onready var inventory = %Inventory

# Children Refs
@onready var fish_catch_display = $FishCatchDisplay
# Inventory Items
@onready var glass_inventory_label = $InventoryDisplay/VBoxContainer/InventoryItemDisplay/GlassInventoryItemContainer/Label

func _ready():
	player_node.caught_fish.connect(_display_fish_catch_display)
	inventory.inventory_updated.connect(_update_inventory_display)

func _display_fish_catch_display():
	fish_catch_display.visible = true

func _update_inventory_display():
	glass_inventory_label.text = str(inventory.inventory["Glass"])
