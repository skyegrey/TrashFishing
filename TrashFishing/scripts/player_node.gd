class_name PlayerNode extends Node2D

@onready var fish = %Fish
@onready var exclamation_point_sprite_2d = $ExclamationPointSprite2D
@onready var inventory = %Inventory

@export var exclamation_point_start_position: Vector2 = Vector2(-32, -20)
@export var exclamation_point_finish_position: Vector2 = Vector2(-32, -70)

# State
var is_fish_at_bobber: bool = false

# Signals
signal caught_fish

func _ready():
	fish.has_approached_bobber.connect(_on_fish_approached_bobber)

func _process(delta):
	if Input.is_action_just_pressed("ui_reel"):
		if is_fish_at_bobber:
			_catch_fish()
	

func _on_fish_approached_bobber():
	is_fish_at_bobber = true
	exclamation_point_sprite_2d.self_modulate.a = .5
	var exclamation_point_tween = get_tree().create_tween()
	exclamation_point_tween.set_parallel()
	var tween_duration = .25
	exclamation_point_tween.tween_property(
		exclamation_point_sprite_2d, 
		"self_modulate:a", 
		1, 
		tween_duration
	)
	exclamation_point_tween.tween_property(
		exclamation_point_sprite_2d,
		"position",
		exclamation_point_finish_position,
		tween_duration
	)

func _catch_fish():
	is_fish_at_bobber = false
	_reset_exclamation_point()
	fish.queue_free()
	_play_catch_animation()
	caught_fish.emit()
	inventory.add_item_to_inventory("Glass")
	

func _reset_exclamation_point():
	exclamation_point_sprite_2d.self_modulate.a = 0
	exclamation_point_sprite_2d.position = exclamation_point_start_position

func _play_catch_animation():
	pass
