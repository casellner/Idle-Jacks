extends Node2D

signal jack_clicked # sent to game.gd

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# Function: _on_texture_button_button_up()
# Purpose:  This function deletes the jack and emits a signal to game.gd
func _on_texture_button_button_up() -> void:
	queue_free()
	emit_signal("jack_clicked")
