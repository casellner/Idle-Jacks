extends Node2D

var mynode = preload("res://jack.tscn") # for spawning jacks

var rand = RandomNumberGenerator.new() # Random number for Jack position
var jack_instance

var score = 0 # Number of jacks collected

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

	# Debugging code to bounce ball by pressing space bar
	#	# if ball is clicked
	#	if Input.is_action_just_pressed("ui_accept"):
	#		$Ball.jump = true # tell ball to jump
	#		spawn_jack() #spawn a jack

# Function: spawn_jack()
# Purpose:  This function instantiates a jack and gives it a random position
func spawn_jack():
	var x = rand.randf_range(90, 450) # 540 - 90
	var y = rand.randf_range(90, 870) # 960 - 90
	
	jack_instance = mynode.instantiate()
	jack_instance.position = Vector2(x, y) # set random position
	jack_instance.rotation = randf_range(0, 2 * PI) #set random rotation
	add_child(jack_instance)
	jack_instance.connect("jack_clicked", Callable(self, "score_jack"))
	

# Function: score_jack()
# Purpose:  This function updates the score and plays the 'jack collected' audio
func score_jack():
	jack_instance = null # Prevents game from crashing
	score += 1
	
	# update text label
	$Score.clear()
	$Score.add_text(str(score))
	
	$AudioStreamPlayer2D.play(randf_range(0.8, 1.2))


# Function: _on_ball_ball_clicked()
# Purpose:  This function determines if the ball should jump and sends an instruction to the ball
func _on_ball_ball_clicked() -> void:
	if $Ball.is_on_floor():
		$Ball.jump = true # tell ball to jump
		spawn_jack() #spawn a jack
