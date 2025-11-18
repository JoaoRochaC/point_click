extends Node2D
@onready var Player : AnimatedSprite2D = $"../Player"
@onready var normal: TileMap = $normal
@onready var normal_2: TileMap = $normal2
@onready var normal_3: TileMap = $normal3
@onready var normal_4: TileMap = $normal4
@onready var normal_5: TileMap = $normal5
#@onready var destination = $Marker2D.global_position

#func interact():
	#if Player.tem_chave == true:
		#normal.hide()
		#normal_2.show()
		#await get_tree().create_timer(0.3).timeout
		#normal_2.hide()
		#normal_3.show()
		#await get_tree().create_timer(0.3).timeout
		#normal_3.hide()
		#normal_4.show()
		#await get_tree().create_timer(0.3).timeout
		#normal_4.hide()
		#normal_5.show()
		#await get_tree().create_timer(0.3).timeout
		#get_tree().change_scene_to_file("res://Cenas/sala_alavanca.tscn")
		#
	#else:
		#print("Acho que preciso de uma chave para abrir")

func observar():
	print("E uma bela porta de madeira")
	
func falar():
	print("como sera que abro essa porta")
