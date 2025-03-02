extends CharacterBody2D



@onready var Active_Manager = get_parent()
@onready var sprite = $Control/PlceHolder  # Adjust the path if necessary

@export var speed: float = 2.0  # Movement speed



func _process(_delta: float) -> void:
	var direction = Vector2.ZERO  # Initialize movement direction
	var is_active = Active_Manager.active # Checks who to move

	if Active_Manager.active != 2:
		


		move_and_collide(Vector2.ZERO)
		
	if is_active == 2:
		
		# Check for input
		direction.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
		direction.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
		move_and_slide()


	# Normalize to prevent faster diagonal movement
	if direction.length() > 0:
		direction = direction.normalized()
		
	position += direction * speed

	
	
	if direction.x > 0:
		sprite.flip_h = true
		sprite.offset.x = -75
	elif direction.x < 0:
		sprite.flip_h = false
		sprite.offset.x = 8  # Reset offset when moving left


func _on_control_gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Active_Manager.active = 2  # Set active state to 2
