extends Node2D

func _on_start_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/mapa_castelo.tscn")


func _on_credit_btn_pressed() -> void:
	pass


func _on_quit_btn_pressed() -> void:
	get_tree().quit()
