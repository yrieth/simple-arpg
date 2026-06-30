extends CharacterBody2D

const BASE_VELOCITY: int = 1000
const BASE_LIGHT_RADIUS: int = 100
const BASE_LIFE: int = 100
const BASE_MANA: int = 100

var max_life: int
var life: int
var max_mana: int
var mana: int


func _ready() -> void:
	life = 100
	mana = 100
	calculate_max_life()
	update_life(max_life, false)
	calculate_max_mana()
	update_mana(max_mana, false)
	mana = max_mana
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
	
func calculate_max_life() -> void:
	max_life = BASE_LIFE
	
	$"../UI/LifeRect/LifePool".max_value = max_life
	$"../UI/LifeRect/Label".text = str(life)+"/"+str(max_life)

func update_life(amount: int, additive: bool = true) -> void:
	if additive:
		life = mini(max_life, life+amount)
	else :
		life = mini(max_life, amount)
	$"../UI/LifeRect/LifePool".value = life
	$"../UI/LifeRect/Label".text = str(life)+"/"+str(max_life)
	
func calculate_max_mana() -> void:
	max_mana = BASE_MANA
	
	$"../UI/ManaRect/ManaPool".max_value = max_mana
	$"../UI/ManaRect/Label".text = str(mana)+"/"+str(max_mana)
	

func update_mana(amount: int, additive: bool = true) -> void:
	if additive:
		mana = mini(max_mana, mana+amount)
	else :
		mana = mini(max_mana, amount)
	$"../UI/ManaRect/ManaPool".value = mana
	$"../UI/ManaRect/Label".text = str(mana)+"/"+str(max_mana)

func _on_life_hover_box_mouse_entered() -> void:
	$"../UI/LifeRect/Label".visible = true

func _on_life_hover_box_mouse_exited() -> void:
	$"../UI/LifeRect/Label".visible = false

func _on_mana_hover_box_mouse_entered() -> void:
	$"../UI/ManaRect/Label".visible = true

func _on_mana_hover_box_mouse_exited() -> void:
	$"../UI/ManaRect/Label".visible = false
