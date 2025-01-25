extends Node2D

signal jack_clicked

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_button_down() -> void:
	print("jack clicked")
	queue_free()
	emit_signal("jack_clicked")
