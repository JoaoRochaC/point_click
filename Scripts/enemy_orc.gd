extends Node2D

const _DIALOG_SCREEN: PackedScene = preload("res://Dialog/dialog_screen.tscn")

@onready var Player : AnimatedSprite2D = $"../../PLayer_cavaleiro"
@onready var destination = get_node("Marker2D").get_global_position()
@onready var navigation_link_2d: NavigationLink2D = $NavigationLink2D

@export_category("Objects")
@export var _hud: CanvasLayer = null

var _dialog_matou: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "BOAAAA!!!!!!!!",
		"title": "CAVALEIRO"
	}
}
var _dialog_sem_espada: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "Vou precisar de uma espada",
		"title": "CAVALEIRO"
	}
}
var _dialog_observar: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": ".......",
		"title": "CAVALEIRO"
	}
}
var _dialog_falar: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": ".......",
		"title": "CAVALEIRO"
	}
}

func _ready() -> void:
	acertou()
	if !Global.matou_orc:
		get_node("Sprite2D").play("idle")
		navigation_link_2d.enabled = false
	if Global.matou_orc:
		get_node("Sprite2D").play("jamorreu")
		self.disabled = true
		navigation_link_2d.enabled = true

func interact():
	if Global.pegou_espada:
		get_tree().change_scene_to_file("res://Cenas/perguntasOrc.tscn")
	else:
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_sem_espada
		_hud.add_child(_new_dialog)
func observar():
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_observar
	_hud.add_child(_new_dialog)
	
func falar():
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_falar
	_hud.add_child(_new_dialog)

func matou():
	Player.global_position = destination
	await get_tree().create_timer(0.3).timeout
	get_node("Sprite2D").play("dead")
	self.disabled = true
	navigation_link_2d.enabled = true
	Global.matou_orc = true

func acertou():
	if Global.acertou:
		matou()
		Global.acertou = false
