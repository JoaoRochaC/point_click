extends CanvasGroup

signal menu_closed
signal menu_opened
signal menu_falar
signal menu_observar

func _on_interagir_pressed() -> void:
	emit_signal("menu_opened")
	queue_free()

func _on_sair_pressed() -> void:
	emit_signal("menu_closed")
	queue_free()

func _on_falar_pressed() -> void:
	emit_signal("menu_falar")
	queue_free()

func _on_observar_pressed() -> void:
	emit_signal("menu_observar")
	queue_free()
