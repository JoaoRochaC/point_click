extends Node2D
@onready var Player : AnimatedSprite2D = $"../../PLayer_cavaleiro"
@onready var destination = get_node("Marker2D").get_global_position()

func interact():
	get_tree().change_scene_to_file("res://Cenas/mapa_castelo.tscn")

func observar():
	print("parece ter alguma coisa escondida nesse objeto")
	
func falar():
	print("oque deveria ser isso?")
