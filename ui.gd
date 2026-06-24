extends CanvasLayer

@onready var viewRect: Rect2
@onready var map_size: Vector2 = Vector2($"../Map".MAP_SIZE, $"../Map".MAP_SIZE) * 16

func _ready() -> void:
	viewRect = get_viewport().get_visible_rect()
	$Control/SubViewportContainer/SubViewport.world_2d = get_tree().root.world_2d
	$Control/SubViewportContainer/SubViewport.size = map_size
	$Control.position = viewRect.size/2 - map_size*$Control.scale.x/2
	
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_focus_next"):
		visible = !visible

func _physics_process(delta: float) -> void:
	$Control/SubViewportContainer/SubViewport/Camera2D.global_position = %Player.global_position
