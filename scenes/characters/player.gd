class_name Player
extends CharacterBody2D

@export var max_look_angle: float = PI/4
@export var speed: float = 50.0

@onready var body: Sprite2D = $Body
@onready var hat: Sprite2D = $Hat

func _process(delta: float) -> void:
	handle_movement()
	handle_look()

func handle_movement() -> void:
	var movement_vec: Vector2 = Input.get_vector("left", "right", "up", "down")
	velocity = movement_vec * speed
	move_and_slide()

## Makes the hat look in the direction of the mouse.  Makes the entire player
## rotate towards the direction of the mouse, but with a buffer zone of
## max_look_angle * 2 in which no movement occurs.  They body will stop on the
## edge of this buffer zone.
func handle_look() -> void:
	var ang = (get_global_mouse_position() - position).angle()
	if abs(angle_difference(ang, rotation)) > max_look_angle:
		if abs(angle_difference(ang + max_look_angle, rotation)) < \
				abs(angle_difference(ang - max_look_angle, rotation)):
			rotation = ang + max_look_angle
		else:
			rotation = ang - max_look_angle
	hat.global_rotation = get_global_mouse_position().angle() + PI/2
