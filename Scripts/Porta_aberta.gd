extends Node2D


const _DIALOG_SCREEN: PackedScene = preload("res://Dialog/dialog_screen.tscn")

@onready var Player : AnimatedSprite2D = $"../../PLayer_cavaleiro"
@onready var destination = get_node("Marker2D").get_global_position()

@export_category("Objects")
@export var _hud: CanvasLayer = null

var _dialog_falar: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "Nao vou falar com uma porta Ne",
		"title": "CAVALEIRO"
	}
}
var _dialog_aberta: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "...........",
		"title": "CAVALEIRO"
	}
}
func interact():
	Global.position = Player.position
	get_tree().change_scene_to_file("res://Cenas/sala_aberta.tscn")

func observar():
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_aberta
	_hud.add_child(_new_dialog)
	
func falar():
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_falar
	_hud.add_child(_new_dialog)
