extends Control

signal options_menu_close

func _on_close_pressed() -> void:
	emit_signal("options_menu_close")
