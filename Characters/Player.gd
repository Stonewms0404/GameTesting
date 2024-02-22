extends CharacterBody2D

class_name Player

@export var speed : float
var movement : Vector2
@export var friction: float
var facing : Vector2

func _physics_process(_delta):
	if (Input.is_action_pressed("left")):
		facing.x = -1
		movement.x = speed * facing.x
	elif (Input.is_action_pressed("right")):
		facing.x = 1
		movement.x = speed * facing.x
	else:
		movement.x = lerp(movement.x, 0.0, friction)
	
	if (Input.is_action_pressed("up")):
		facing.y = -1
		movement.y = speed * facing.y
	elif (Input.is_action_pressed("down")):
		facing.y = 1
		movement.y = speed * facing.y
	else:
		movement.y = lerp(movement.y, 0.0, friction)
	
	velocity = movement
	
	move_and_slide()
