extends Node2D

export var frame_count:int=45
var rng:RandomNumberGenerator = RandomNumberGenerator.new()
var asteroid:PackedScene = preload("res://entities/EnemyAsteroid.tscn")

func _ready()->void:

	pass # Replace with function body.


func _process(delta)->void:
	if get_tree().get_frame() % frame_count == 0:
		print("Added asteroid")
		spawn_asteroid()
	pass

func spawn_asteroid()->void:
	var new_asteroid = asteroid.instance()
	var size:Vector2 = get_viewport().size
	add_child(new_asteroid)
	var rectangleShape:RectangleShape2D = new_asteroid.get_node("CollisionShape2D").shape
	randomize()
	new_asteroid.position.x = size.x + rectangleShape.extents.x
	new_asteroid.position.y = rng.randi_range(0, size.y)
