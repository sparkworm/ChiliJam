class_name Level
extends Node2D

@onready var characters = $Characters
@onready var projectiles = $Projectiles
@onready var world = $World

func add_projectile(projectile: Node2D) -> void:
	projectiles.add_child(projectile)
