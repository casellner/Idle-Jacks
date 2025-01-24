extends Node2D

var mynode = preload("res://jack.tscn")

# Random number for Jack position
var rand = RandomNumberGenerator.new()

var jack_instance : Node = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rand.randomize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# if ball is on the ground
	if $Ball.is_on_floor():
		# delete any jacks
		if jack_instance:
			jack_instance.queue_free()
			jack_instance = null
		# if ball is clicked
		if Input.is_action_just_pressed("ui_accept"):
			$Ball.jump = true # tell ball to jump
			spawn_jack() #spawn a jack

# Function: spawn_jack()
# Purpose:  This function instantiates a jack and gives it a random position
func spawn_jack():
	var x = rand.randf_range(0, 300)
	var y = rand.randf_range(0, 300)
	
	jack_instance = mynode.instantiate()
	jack_instance.position = Vector2(x, y)
	add_child(jack_instance)
