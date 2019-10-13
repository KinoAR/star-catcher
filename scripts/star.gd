extends KinematicBody2D

export var speed:int=200
const direction:Vector2 = Vector2(-1, 0)
const player_layer = 1
signal player_get_star

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("stars")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision = process_movement(delta)
	process_collision(collision)
	if outside_viewport_on_left(position):
		die()
	pass

func process_movement(delta)->KinematicCollision2D:
	return move_and_collide(direction * speed * delta)

func process_collision(collision:KinematicCollision2D)->void:
	if collision.collider.collision_layer == player_layer:
		obtained()
	pass

func outside_viewport_on_left(position:Vector2)->bool:
	if position.x < -32:
		return true
	else:
		return false

func obtained()->void:
	emit_signal("player_get_star")
	die()
	pass

func die()->void:
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	queue_free()
	return true