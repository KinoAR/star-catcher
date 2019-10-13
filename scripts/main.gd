extends Node2D

export var asteroid_frame_count:int=45
export var star_frame_count:int=30
var rng:RandomNumberGenerator = RandomNumberGenerator.new()
var asteroid:PackedScene = preload("res://entities/EnemyAsteroid.tscn")
var star:PackedScene = preload("res://entities/Star.tscn")

func _ready()->void:

	pass # Replace with function body.


func _process(delta)->void:
	var frames = get_tree().get_frame()
	if frames % asteroid_frame_count == 0:
		print("Added asteroid")
		spawn_asteroid()
	if frames % star_frame_count == 0:
		print("Added Star")
		spawn_star()
	pass

func spawn_asteroid()->void:
	var new_asteroid = asteroid.instance()
	var size:Vector2 = get_viewport().size
	add_child(new_asteroid)
	var rectangleShape:RectangleShape2D = new_asteroid.get_node("CollisionShape2D").shape
	randomize()
	new_asteroid.position.x = size.x + rectangleShape.extents.x
	new_asteroid.position.y = rng.randi_range(0, size.y)

func spawn_star()->void:
	var new_star:= star.instance()
	var size:Vector2 = get_viewport().size
	add_child(new_star)
	randomize()
	new_star.position.x = size.x + 35
	new_star.position.y = rng.randi_range(0, size.y)
	pass