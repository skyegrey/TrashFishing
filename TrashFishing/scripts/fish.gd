class_name Fish extends Node2D

# Scene Refs
@onready var bobber = %Bobber

@onready var move_towards_bobber_tween: Tween

# Properties
@export var bobber_deadzone = 32 # pixels

# State 
@onready var is_at_bobber: bool = false

# Signals
signal has_approached_bobber

func _ready():
	_create_move_twoards_bobber_tween()

func _process(delta):
	if (
		not is_at_bobber 
		and position.distance_to(bobber.position) <= bobber_deadzone
	):
		is_at_bobber = true
		move_towards_bobber_tween.kill()
		has_approached_bobber.emit()

func _create_move_twoards_bobber_tween():
	move_towards_bobber_tween = get_tree().create_tween()
	move_towards_bobber_tween.tween_property(
		self,
		"position",
		bobber.position,
		2
	)
