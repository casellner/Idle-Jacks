extends Control

signal upgrades_menu_close
signal add_jack

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_close_pressed() -> void:
	emit_signal("upgrades_menu_close")


func _on_add_jack_pressed() -> void:
	emit_signal("add_jack")
	print("in jack_pressed function")
