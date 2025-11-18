extends Node2D

var resposta_feita: bool

const _DIALOG_SCREEN: PackedScene = preload("res://Dialog/dialog_screen.tscn")

@export_category("Objects")
@export var _hud: CanvasLayer = null

var _dialog_primeira_pergunta: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/orc_dialogo.tres",
		"dialog": "Quanto e 1 + 1?",
		"title": "ORC"
	}
}
var _dialog_segunda_pergunta: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/orc_dialogo.tres",
		"dialog": "Muito bem, parece que voce acerto, mas essa era apenas para comecar...",
		"title": "ORC"
	},
	1: {
		"faceset": "res://Assets/Png.adicionais/orc_dialogo.tres",
		"dialog": "Agora, quanto e 1 * 1?",
		"title": "ORC"
	}
}


func _ready() -> void:
	primeira_pergunta()

func primeira_pergunta():
	Global.fez_pergunta = true
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_primeira_pergunta
	_hud.add_child(_new_dialog)

func nova_pergunta(): 
	resposta_feita = true
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_segunda_pergunta
	_hud.add_child(_new_dialog)
