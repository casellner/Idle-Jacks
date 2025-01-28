extends TextureButton

@export var TEXTURE_NORMAL_VARIATIONS_ARRAY: Array = [
	preload("res://sprites/jack.png"),
	preload("res://sprites/jock.png")
]

@export var TEXTURE_PRESSED_VARIATIONS_ARRAY: Array = [
	preload("res://sprites/jack90.png"),
	preload("res://sprites/jock90.png")
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var texture_id: int = randi() % TEXTURE_NORMAL_VARIATIONS_ARRAY.size()
	var chosen_texture_normal: Texture = TEXTURE_NORMAL_VARIATIONS_ARRAY[texture_id]
	var chosen_texture_pressed: Texture = TEXTURE_PRESSED_VARIATIONS_ARRAY[texture_id]
	texture_normal = chosen_texture_normal
	texture_pressed = chosen_texture_pressed
