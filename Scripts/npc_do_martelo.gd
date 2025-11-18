extends Node2D
const _DIALOG_SCREEN: PackedScene = preload("res://Dialog/dialog_screen.tscn")
@onready var Player : AnimatedSprite2D = $"../../PLayer_cavaleiro"
@onready var destination = get_node("Marker2D").get_global_position()

var _dialog_martelo: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/npc_martelo.tres",
		"dialog": "Opa, que bom que voce achou, achei que nao conseguiria entrar em casa hoje",
		"title": "O CARA QUE ESQUECEU A SENHA"
		},
	1: {
		"faceset": "res://Assets/Png.adicionais/npc_martelo.tres",
		"dialog": "Por conta da sua ajuda, tome esse MARTELO, pode-lhe ser util",
		"title": "O CARA QUE ESQUECEU A SENHA"
		},
	2: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "Agora, e saber onde eu vou usar esse martelo",
		"title": "CAVALEIRO"
		},
	3: {
		"faceset": "res://Assets/Png.adicionais/npc_martelo.tres",
		"dialog": "Agora, isso e com voce",
		"title": "O CARA QUE ESQUECEU A SENHA"
		}
}
var _dialog_quest: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/npc_martelo.tres",
		"dialog": "Boa tarde Sr.Cavaleiro, poderia me ajudar a encontrar a senha da minha casa?",
		"title": "O CARA QUE ESQUECEU A SENHA"
	},
	1: {
		"faceset": "res://Assets/Png.adicionais/npc_martelo.tres",
		"dialog": "Acabei perdendo em algum lugar mas nao lembro onde foi",
		"title": "O CARA QUE ESQUECEU A SENHA"
	},
	2: {
		"faceset": "res://Assets/Png.adicionais/npc_martelo.tres",
		"dialog": "Se voce encontrar a senha tenho uma recompensa para voce",
		"title": "O CARA QUE ESQUECEU A SENHA"
	}
}
var _dialog_observar: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "Que visual estranho de se ver, oque sera que ele e",
		"title": "CAVALEIRO"
	}
}
var _dialog_falar: Dictionary = {
	0: {
		"faceset": "res://Assets/Png.adicionais/Soldier (1).png",
		"dialog": "Como sera que ele perdeu essa senha",
		"title": "CAVALEIRO"
	}
}

@export_category("Objects")
@export var _hud: CanvasLayer = null

func interact():
	if Global.pegou_martelo:
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_quest
		_hud.add_child(_new_dialog)
		
	elif Global.pegou_codigo == true:
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_martelo
		_hud.add_child(_new_dialog)
		Global.pegou_martelo = true

func observar():
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_observar
	_hud.add_child(_new_dialog)

func falar():
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_falar
	_hud.add_child(_new_dialog)
