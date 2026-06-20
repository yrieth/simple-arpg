extends Node2D

const MAP_SIZE: int = 256
@onready var map_gen: GaeaGenerator = $GaeaGenerator


func _ready() -> void:
	$Border/BorderCollision.polygon[0] = Vector2(0,0)
	$Border/BorderCollision.polygon[1] = Vector2(MAP_SIZE*16,0)
	$Border/BorderCollision.polygon[2] = Vector2(MAP_SIZE*16,MAP_SIZE*16)
	$Border/BorderCollision.polygon[3] = Vector2(0,MAP_SIZE*16)
	
	map_gen.world_size = Vector3i(MAP_SIZE, MAP_SIZE, 1)
	map_gen.generate()
