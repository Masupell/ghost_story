class_name Player
extends CharacterBody2D

@export var speed = 250
@onready var inventory := $Journal

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_released("inventory"):
		inventory.visible = !inventory.visible
