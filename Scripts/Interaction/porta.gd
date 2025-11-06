extends Area2D

# Ponto que o jogador deve alcançar para interagir
@onready var destination = get_node("Marker2D").get_global_position()

func interact():
	print("Objeto interagiu (padrão do template)")
