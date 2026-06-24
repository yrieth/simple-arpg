extends Sprite2D

var tween: Tween

func _ready() -> void:
	restart_tween()
	
func position_generator() -> Array[Vector2]:
	var x: float = randf_range(-500, 500)
	var y: float
	if x > 400 or x <-400:
		y = randf_range(-250,230)
		return [Vector2(x,y), Vector2(-x, randf_range(-250,230))]
	else:
		y = 230
		if randf()>0.5:
			return [Vector2(x,y), Vector2(randf_range(-500, 500),-y)]
		else :
			return [Vector2(x,-y), Vector2(randf_range(-500, 500),y)]


func restart_tween() -> void:
	await get_tree().create_timer(randi_range(0, 4)).timeout
	var tween: Tween = create_tween()
	tween.finished.connect(restart_tween)
	var pos: Array[Vector2] = position_generator()
	position = pos[0]
	tween.tween_property(self, "position", pos[1], randi_range(10, 20))
	
