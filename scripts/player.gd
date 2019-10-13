extends KinematicBody2D
class_name Player

export var speed:int=200
export var health:int=3

const enemy_layer:int = 2
const items_layer:int = 4
signal hit
signal get_item(item)

func _ready()->void:
	pass # Replace with function body.

func _process(delta)->void:
	process_movement()
	pass

func process_movement()->void:
	var direction:Vector2 = Vector2(0, 0)
	var size = get_viewport().size
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	position.x = clamp(position.x, 0, size.x)
	position.y = clamp(position.y, 0, size.y)
	move_and_slide(direction * speed)

func process_collisions():
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		match collision.collider.collision_layer:
			enemy_layer:
				emit_signal("hit")
			items_layer:
				emit_signal("get_item")



func add_health(value:int)->int:
	return health + value

func is_alive()->bool:
	return health > 0