extends TextureButton

"""
"    Texture randomization code adapted from godot-texture-variation-tutorial
"    Ivan Shyika
"    Accessed 1/27/2025
"    https://github.com/IvessJohn/godot-texture-variation-tutorial
"""

# array of normal (not pressed) jack button textures
@export var TEXTURE_NORMAL_VARIATIONS_ARRAY: Array = [
	preload("res://sprites/jack.png"),
	preload("res://sprites/jock.png")
]

# array of pressed jack button textures
@export var TEXTURE_PRESSED_VARIATIONS_ARRAY: Array = [
	preload("res://sprites/jack90.png"),
	preload("res://sprites/jock90.png")
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# pick random texture
	var texture_id: int = randi() % TEXTURE_NORMAL_VARIATIONS_ARRAY.size()
	var chosen_texture_normal: Texture = TEXTURE_NORMAL_VARIATIONS_ARRAY[texture_id]
	var chosen_texture_pressed: Texture = TEXTURE_PRESSED_VARIATIONS_ARRAY[texture_id]
	texture_normal = chosen_texture_normal
	texture_pressed = chosen_texture_pressed
