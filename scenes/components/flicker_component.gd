class_name FlickerComponent
extends Node

## The light that will be controlled by this
@export var light: Light2D
## Min fraction of intial energy that the light can be
@export var flicker_min: float = 0.5
## Max multiple of initial energy that the light can be
@export var flicker_max: float = 1.3
## Time between light recalculations
@export var flicker_period: float = 0.5

var initial_energy: float
var current_energy: float
var next_energy: float

@onready var timer: Timer = $Timer

func _ready() -> void:
	initial_energy = light.energy
	next_energy = initial_energy
	timer.wait_time = flicker_period
	start()

func stop() -> void:
	timer.stop()

func start() -> void:
	timer.start()

func _on_timer_timeout() -> void:
	current_energy = next_energy
	next_energy = randf_range(flicker_min*initial_energy,
			flicker_max*initial_energy)
	var tween: Tween = create_tween()
	tween.tween_property(light, "energy", next_energy, flicker_period)
