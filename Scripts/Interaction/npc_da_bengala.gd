extends Node2D

const _DIALOG_SCREEN: PackedScene = preload("res://Dialog/dialog_screen.tscn")
@onready var Player : AnimatedSprite2D = $"../../PLayer_cavaleiro"
@onready var destination = get_node("Marker2D").get_global_position()

var _dialog_quest: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Fotomarinheiro.tres",
		"dialog": "Porfavor me ajuda, amanha vou me casar e acabei esquecendo de comprar um anel",
		"title": "BOB O MARINHEIRO"
	},
	1: {
		"faceset": "res://Assets/Png.adicionais/Fotomarinheiro.tres",
		"dialog": "Eu sei que dentro do castelo tem um ANEL magico que me pode ser util",
		"title": "BOB O MARINHEIRO"
	},
	2: {
		"faceset": "res://Assets/Png.adicionais/Fotomarinheiro.tres",
		"dialog": "Se voce encontrar poderia me falar, posse te ajudar se precisar. Voce e minha ultima esperanca",
		"title": "BOB O MARINHEIRO"
	},
}
var _dialog_anel: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "Acabei de encontrar o anel, mas vou precisar de alguma coisa para tirar ele da parede, esta bem fundo",
		"title": "CAVALEIRO"
		},
	1: {
		"faceset": "res://Assets/Png.adicionais/Fotomarinheiro.tres",
		"dialog": "Nao se preoculpe, tome essa bengala que meu avo havia de dado, pode ser que ela ajude",
		"title": "BOB O MARINHEIRO"
		},
	2: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "Vou tentar tirar da parede, se der certo eu te entrego",
		"title": "CAVALEIRO"
		},
}
var _dialog_pegou: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "Deu tudo certo pegue o anel",
		"title": "CAVALEIRO"
		},
	1: {
		"faceset": "res://Assets/Png.adicionais/Fotomarinheiro.tres",
		"dialog": "Minha nossa muito obrigado, vou te dar um dos meus tesouros que peguei em uma viajem, espero que lhe seja util",
		"title": "BOB O MARINHEIRO"
		}
}
var _dialog_agradecido: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Fotomarinheiro.tres",
		"dialog": "MUITO OBRIGADO !!!!!!",
		"title": "BOB O MARINHEIRO"
		}
}

var _dialog_observou: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "Parece uma muralha ambulante",
		"title": "CAVALEIRO"
		}
}
var _dialog_falar: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "espero que de tudo certo",
		"title": "CAVALEIRO"
		}
}

@export_category("Objects")
@export var _hud: CanvasLayer = null

func interact():
	if Global.pegou_espada:
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_agradecido
		_hud.add_child(_new_dialog)
		
	if !Global.tem_anel and !Global.observou_anel and !Global.pegou_espada:
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_quest
		_hud.add_child(_new_dialog)
		
	if Global.tem_anel == true:
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_pegou
		_hud.add_child(_new_dialog)
		Global.tem_anel = false
		Global.pegou_espada = true

	elif Global.observou_anel == true:
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_anel
		_hud.add_child(_new_dialog)
		Global.pegou_bengala = true
		Global.observou_anel = false

func observar():
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_observou
	_hud.add_child(_new_dialog)
	
func falar():
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_falar
	_hud.add_child(_new_dialog)
