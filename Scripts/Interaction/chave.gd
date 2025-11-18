extends Node2D

const _DIALOG_SCREEN: PackedScene = preload("res://Dialog/dialog_screen.tscn")
@onready var inventory_ui = $"../PauseMenu/Inventory"
@onready var Player : AnimatedSprite2D = $"../../PLayer_cavaleiro"
@onready var destination = get_node("Marker2D").get_global_position()

@onready var child = get_node("Sprite2D")

var _dialog_interagir: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "Onde eu posso usala?",
		"title": "CAVALEIRO"
	}
}
var _dialog_observar: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "...............",
		"title": "CAVALEIRO"
	}
}
var _dialog_falar: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "...............",
		"title": "CAVALEIRO"
	}
}

@export_category("Objects")
@export var _hud: CanvasLayer = null

func _ready() -> void:
	if Global.pegou_chave:
		queue_free()

func _process(delta: float) -> void:
	if !Global.matou_orc and !Global.pegou_chave:
		self.disabled = true
	elif Global.matou_orc:
		self.disabled = false
	if Global.pegou_chave:
		self.disabled = true
		

func interact():
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_interagir
	_hud.add_child(_new_dialog)
	Global.pegou_chave = true
	if !Global.player_dialogo:
		child.queue_free()

func observar():
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_observar
	_hud.add_child(_new_dialog)
	
func falar():
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_falar
	_hud.add_child(_new_dialog)
