extends Node2D
@onready var Player : AnimatedSprite2D = $"../../Player"
@onready var destination = get_node("Marker2D").get_global_position()

func interact():
	if Player.tem_chave == true:
		print("abriu porta")
	else:
		print("Acho que preciso de uma chave para abrir")

func observar():
	print("E uma bela porta de madeira")
	
func falar():
	print("como sera que abro essa porta")
