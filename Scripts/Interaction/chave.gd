extends Node2D
@onready var Player : AnimatedSprite2D = $"../../Player"
# Ponto que o jogador deve alcançar para interagir
@onready var destination = get_node("Marker2D").get_global_position()

func interact():
	Player.tem_chave = true
	print("voce pegou a chave")
	queue_free()

func observar():
	print("Uma chave muito brilhante")
	
func falar():
	print("onde sera que eu ultilizo ela")
