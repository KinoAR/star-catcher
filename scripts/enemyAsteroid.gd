extends KinematicBody2D


export var speed:int=200
const direction:Vector2 = Vector2(-1, 0)
const player_layer = 1
var is_dead = false
func _ready():
	add_to_group("enemies")
	pass # Replace with function body.

func _process(delta:float)->void:
	process_movement(delta)
	pass

func process_movement(delta:float)->void:
	var collision:KinematicCollision2D = move_and_collide(direction * speed * delta)
	if collision != null:
		if collision.collider.collision_layer == player_layer:
			is_dead = die()
	if outside_viewport_on_left(position):
		is_dead = die()
	pass

func outside_viewport_on_left(position:Vector2)->bool:
	if position.x < -32:
		return true
	else:
		return false



func die()->bool:
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	queue_free()
	return true