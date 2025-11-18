extends Node2D

@onready var pergunta_fase: Node2D = $perguntaFase

var correta
var proxima = 0

func _ready() -> void:
	$PLayer_cavaleiro.position = $InteractionTemplate/Enemy_orc.position - Vector2(175,0)

func _on_btn_1_pressed() -> void:
	if proxima == 0: # primeira pergunta
		certo()
		$"1_pergunta".hide()
		$"2_pergunta".show()
	elif proxima == 1:
		pass
	elif proxima == 2:
		pass

func _on_btn_2_pressed() -> void:
	if proxima == 0:
		pass
	elif proxima == 1:
		pass
	elif proxima == 2:
		pass

func _on_btn_3_pressed() -> void:
	if proxima == 0:
		pass
	elif  proxima == 1:
		$"2_pergunta".hide()
		$"3_pergunta".show()
		certo()
		print("oi")
	elif proxima == 2:
		certo()
		
func certo():
	proxima += 1
	if proxima == 1:
		$btn1.text = "2"
		$btn2.text = "20"
		$btn3.text = "1"
	if proxima == 2:
		$btn1.text = "5"
		$btn2.text = "6"
		$btn3.text = "4"
	if proxima == 3:
		Global.acertou = true
		get_tree().change_scene_to_file("res://Cenas/sala_aberta.tscn")
