"""
"    Volume slider code adapted from volume-sliders
"    The Shaggy Dev
"    Accessed 4/12/2025
"    https://github.com/theshaggydev/the-shaggy-dev-projects/tree/main/projects/godot-4/volume-sliders
"""

extends HSlider

@export
var bus_name: String

var bus_index: int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	value_changed.connect(_on_value_changed)

func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(value) # makes linear slider behave logarithmically
	)
