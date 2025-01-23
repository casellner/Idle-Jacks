extends CharacterBody2D

const BOUNCE_VELOCITY = -800.0 # speed at which ball is bounced when clicked

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Gravity physics
func _physics_process(delta):
	# Affect ball by gravity
	if not is_on_floor():
		velocity.y += gravity * delta
		
	# Handle jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = BOUNCE_VELOCITY
	
	move_and_slide()
