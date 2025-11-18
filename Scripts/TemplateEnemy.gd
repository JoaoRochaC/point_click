extends Node2D

@onready var Player : AnimatedSprite2D = $"../../PLayer_cavaleiro"
@onready var destination = get_node("Marker2D").get_global_position()

func interact():
	print("Voce pegou um codigo")

func observar():
	print("Uma chave muito brilhante")
	
func falar():
	print("onde sera que eu ultilizo ela")
