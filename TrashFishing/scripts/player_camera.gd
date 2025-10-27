class_name PlayerCamera extends Camera2D

# Scene Refs
@onready var player_node: PlayerNode = %PlayerNode

# Properties
@export var zoom_in_zoom = Vector2(2.0, 2.0)
@export var zoom_in_offset = Vector2(32, 0)
@export var zoom_duration = .75

func _ready():
	player_node.caught_fish.connect(_zoom_in_on_catch)

func _zoom_in_on_catch():
	var zoom_tween = get_tree().create_tween()
	zoom_tween.set_parallel()
	zoom_tween.tween_property(self, "zoom", zoom_in_zoom, zoom_duration)
	zoom_tween.tween_property(self, "offset", zoom_in_offset, zoom_duration)
