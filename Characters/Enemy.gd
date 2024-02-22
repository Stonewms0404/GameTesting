extends CharacterBody2D

@export var speed : float
var playerInRange : bool
var playerObj : CharacterBody2D

func _ready():
	playerObj = get_tree().get_nodes_in_group("Player")[0]

func _physics_process(delta):
	if (playerInRange):
		movement()
	else:
		velocity = Vector2.ZERO
	move_and_slide()

func movement():
	global_position.x = move_toward(global_position.x, playerObj.global_position.x, 0.9)
	global_position.y = move_toward(global_position.y, playerObj.global_position.y, 0.9)
	


func _on_search_area_body_entered(body):
	if (body.is_in_group("Player")):
		playerInRange = true


func _on_search_area_body_exited(body):
	playerInRange = false
