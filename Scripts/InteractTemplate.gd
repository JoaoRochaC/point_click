extends Node2D

const _DIALOG_SCREEN: PackedScene = preload("res://Dialog/dialog_screen.tscn")

@onready var Player : AnimatedSprite2D = $"../../PLayer_cavaleiro"
@onready var normal: TileMap = $normal
@onready var normal_2: TileMap = $normal2
@onready var normal_3: TileMap = $normal3
@onready var normal_4: TileMap = $normal4
@onready var normal_5: TileMap = $normal5
@onready var destination = get_node("Marker2D").get_global_position()

@export_category("Objects")
@export var _hud: CanvasLayer = null


var _dialog_observar: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "Parece que so consiguirei abrir com uma chave",
		"title": "CAVALEIRO"
	}
}
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

func _ready() -> void:
	if Global.porta_aberta == true:
		normal.hide()
		normal_5.show()

func interact():
	Global.position = Player.position
	if Global.porta_aberta == true:
		get_tree().change_scene_to_file("res://Cenas/Sala_alavanca.tscn")
	elif Global.pegou_chave == true:
		normal.hide()
		normal_2.show()
		await get_tree().create_timer(0.3).timeout
		normal_2.hide()
		normal_3.show()
		await get_tree().create_timer(0.3).timeout
		normal_3.hide()
		normal_4.show()
		await get_tree().create_timer(0.3).timeout
		normal_4.hide()
		normal_5.show()
		await get_tree().create_timer(0.3).timeout
		Global.porta_aberta = true
		get_tree().change_scene_to_file("res://Cenas/Sala_alavanca.tscn")
	else:
		#barulho de porta 
		pass

func observar():
	if !Global.porta_aberta:
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_observar
		_hud.add_child(_new_dialog)
	else:
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_aberta
		_hud.add_child(_new_dialog)
		
func falar():
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_falar
	_hud.add_child(_new_dialog)
