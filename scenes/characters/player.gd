class_name Player
extends CharacterBody2D

@export var max_look_angle: float = PI/4

@onready var body: Sprite2D = $Body
@onready var hat: Sprite2D = $Hat

func _process(delta: float) -> void:
	# make the hat look in the direction of the mouse
	# NOTE: should only be done when the player isn't moving
	hat.rotation = get_angle_to(get_global_mouse_position())+PI/2
	if abs(angle_difference(hat.rotation, body.rotation)) > max_look_angle:
		if abs(angle_difference(hat.rotation + max_look_angle, body.rotation)) < \
				abs(angle_difference(hat.rotation - max_look_angle , body.rotation)):
			body.rotation = hat.rotation + max_look_angle
		else:
			body.rotation = hat.rotation - max_look_angle
