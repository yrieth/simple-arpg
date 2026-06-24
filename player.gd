extends CharacterBody2D

const BASE_VELOCITY: int = 1000
const BASE_LIGHT_RADIUS: int = 100

func _ready() -> void:
	visible = false
	position = Vector2($"../Map".MAP_SIZE*8,$"../Map".MAP_SIZE*8)



func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	velocity = Vector2(0,0)
	calculate_velocity()
	move_and_slide()
	look_at(get_global_mouse_position())

func calculate_velocity() -> void:
	velocity.x = BASE_VELOCITY * (Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left"))
	velocity.y = BASE_VELOCITY * (Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up"))


func _on_tile_map_gaea_renderer_render_finished() -> void:
	visible = true
