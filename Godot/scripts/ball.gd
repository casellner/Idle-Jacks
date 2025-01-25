extends CharacterBody2D

signal ball_clicked # sent to game.gd

const BOUNCE_VELOCITY = -800.0 # speed at which ball is bounced when clicked

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var jump # changed by game.gd

# Ball physics
func _physics_process(delta):
	# Affect ball by gravity
	if not is_on_floor():
		velocity.y += gravity * delta
		
	# if jump command was sent by game.gd
	if jump:
		jump = false # make jump command false
		velocity.y = BOUNCE_VELOCITY # give ball upward velocity
		$AudioStreamPlayer2D.play()
	
	move_and_slide()

# Function: _on_texture_button_button_up()
# Purpose:  This function emits a signal to game.gd to inform the parent that the ball has been clicked
func _on_texture_button_button_up() -> void:
	emit_signal("ball_clicked")
