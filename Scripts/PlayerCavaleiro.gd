extends AnimatedSprite2D

var tem_chave: bool = false
var menu_aberto: bool = false

var destino = Vector2()
var distancia  = Vector2()
var path : Array

enum{IDLE, MOVE, INTERACT}

var state = IDLE
var speed = 250
var interaction_timer : float = 1

var is_going_to_interact : bool
var interactable_object

#@onready var PlayerAnimation = $AnimatedSprite2D

func _ready():
	destino = position

func _process(delta):
	var move_distance = speed * delta
	match state:
		IDLE:
			pass
		MOVE:
			move_along_path(move_distance)
		INTERACT:
			interact(delta)
	pass

func move_along_path(distance):
	if path == null or path.size() == 0:
		if is_going_to_interact:
			change_state(INTERACT)
		else:
			change_state(IDLE)
			return


	var starting_point = position

	if path.size() > 0:
		if starting_point.x < path[0].x:
			flip_h = false
		elif starting_point.x > path[0].x:
			flip_h = true

	while path.size() > 0 and distance > 0.0:
		var next_point : Vector2 = path[0]
		var distance_to_next = starting_point.distance_to(next_point)

		if distance_to_next == 0.0:
			path.remove_at(0)
			starting_point = next_point
			continue

		if distance <= distance_to_next:
			var t = distance / distance_to_next
			position = starting_point.lerp(next_point, t)
			return

		distance -= distance_to_next
		position = next_point
		starting_point = next_point
		path.remove_at(0)

	if path.size() == 0:
		if is_going_to_interact:
			change_state(INTERACT)
			is_going_to_interact = false
		else:
			change_state(IDLE)
			pass

func interact(delta):
	if !menu_aberto: 
		var menu = preload("res://Cenas/menu_escolha.tscn").instantiate()
		menu.name = "MenuEscolha"
		get_tree().root.add_child(menu)
		menu_aberto = true
		menu.connect("menu_closed", Callable(self, "_on_menu_closed"))
		menu.connect("menu_opened", Callable(self, "_on_menu_opened"))
		menu.connect("menu_falar", Callable(self, "_on_menu_falar"))
		menu.connect("menu_observar", Callable(self, "_on_menu_observar"))

func _on_menu_falar():
	menu_aberto = false
	interactable_object.falar()
	change_state(IDLE)

func _on_menu_observar():
	menu_aberto = false
	interactable_object.observar()
	change_state(IDLE)

func _on_menu_opened():
	menu_aberto = false
	interactable_object.interact()
	change_state(IDLE)

func _on_menu_closed():
	menu_aberto = false
	change_state(IDLE)
	
func change_state(newState):
	state = newState
	match state:
		IDLE:
			self.play("idle")
		MOVE:
			self.play("move")
		INTERACT:
			self.play("interact")
