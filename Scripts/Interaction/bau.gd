extends Node2D

const _DIALOG_SCREEN: PackedScene = preload("res://Dialog/dialog_screen.tscn")

@onready var Player : AnimatedSprite2D = $"../../PLayer_cavaleiro"
@onready var destination = get_node("Marker2D").get_global_position()
@onready var bau_fechado: TileMapLayer = $bau_fechado
@onready var bau_aberto: TileMapLayer = $bau_aberto

@export_category("Objects")
@export var _hud: CanvasLayer = null

var _dialog_interagir: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "Parece um codigo para alguam coisa",
		"title": "CAVALEIRO"
	}
}
var _dialog_observar: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": ".........",
		"title": "CAVALEIRO"
	}
}
var _dialog_falar: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "Porque deixaram uma coisa dessas tao facil de se pegar aqui?",
		"title": "CAVALEIRO"
	}
}

func interact():
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_interagir
	_hud.add_child(_new_dialog)
	bau_fechado.hide()
	bau_aberto.show()
	Global.pegou_codigo = true

func observar():
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_observar
	_hud.add_child(_new_dialog)
	
func falar():
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_falar
	_hud.add_child(_new_dialog)
