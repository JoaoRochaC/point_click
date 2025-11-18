extends Node2D

@onready var Player : AnimatedSprite2D = $"../../PLayer_cavaleiro"
@onready var destination = get_node("Marker2D").get_global_position()
@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@onready var tile_map_layer_2: TileMapLayer = $TileMapLayer2

var pode_ver: bool = false

const _DIALOG_SCREEN: PackedScene = preload("res://Dialog/dialog_screen.tscn")

var _dialog_interagir: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "Preciso de algo para quebrar essa parede",
		"title": "CAVALEIRO"
	}
}
var _dialog_observar: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "E uma parede bem suspeita, oque pode ter atras dela?",
		"title": "CAVALEIRO"
	}
}

var _dialog_falar: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "............",
		"title": "CAVALEIRO"
	}
}

@export_category("Objects")
@export var _hud: CanvasLayer = null

func interact():
	if Global.pegou_martelo:
		#vai quebrar aqui
		pode_ver = true
		tile_map_layer.hide()
		tile_map_layer_2.show()
	else:
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_interagir
		_hud.add_child(_new_dialog)
		
func observar():
	if pode_ver:
		#mudar a cena para nao ter nada
		return
	else:
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_observar
		_hud.add_child(_new_dialog)
	
func falar():
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_falar
	_hud.add_child(_new_dialog)
