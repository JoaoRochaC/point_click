extends Control
const GAUNTLET_POINT = preload("res://Assets/PNG/Outline/Default/gauntlet_point.png")
@onready var nav2D : NavigationRegion2D = $NavigationRegion2D
@onready var Player : AnimatedSprite2D = $PLayer_cavaleiro
@onready var InteractionObject : Area2D = $InteractionTemplate

var nav_map

enum{IDLE, MOVE, INTERACT}

func _ready():
	Input.set_custom_mouse_cursor(GAUNTLET_POINT, Input.CURSOR_POINTING_HAND)
	nav_map = nav2D.get_navigation_map()
	
func _input(event):
	if Player.state == Player.INTERACT:
		return
	if !Input.is_action_just_pressed("Click"):
		return
	if Global.player_dialogo == true:
		return
		
	var new_path = NavigationServer2D.map_get_path(nav_map, Player.global_position, get_global_mouse_position(), false)

	Player.path = new_path
	
	if !Player.is_going_to_interact:
		Player.change_state(MOVE)
	
	Player.is_going_to_interact = false

func _on_interaction_template_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if !Input.is_action_just_pressed("Click"):
		return
	else:
		Player.is_going_to_interact = true
		Player.interactable_object = InteractionObject.get_child(shape_idx)
		var new_path = NavigationServer2D.map_get_path(nav_map, Player.global_position, InteractionObject.get_child(shape_idx).destination,true)
		Player.path = new_path
