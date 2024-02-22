extends CharacterBody2D

class_name Player

@export var speed : float
@export var friction : float

@onready var anim : AnimationTree = $AnimationTree

var movement : Vector2
var facing : Vector2

func _physics_process(_delta):
	movement = Input.get_vector("left", "right", "up", "down")
	
	if (Input.is_action_pressed("left")):
		facing.x = -1
	elif (Input.is_action_pressed("right")):
		facing.x = 1
	
	if (Input.is_action_pressed("up")):
		facing.y = -1
	elif (Input.is_action_pressed("down")):
		facing.y = 1
	
	velocity = lerp(movement * speed, Vector2.ZERO, friction)
	
	if abs(velocity.x) < .5 && abs(velocity.y) < .5:
		velocity = Vector2.ZERO
	
	change_animation()
	
	move_and_slide()

func change_animation():
	if velocity == Vector2.ZERO:
		anim["parameters/conditions/idle"] = true
		anim["parameters/conditions/is_moving"] = false
	else:
		anim["parameters/conditions/idle"] = false
		anim["parameters/conditions/is_moving"] = true
	
	anim["parameters/Idle/blend_position"] = movement;
	anim["parameters/Walk/blend_position"] = movement;
