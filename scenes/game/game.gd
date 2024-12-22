## Highest node, responsible for functions such as switching scenes
class_name Game
extends Node

@onready var current_scene_parent = $CurrentSceneParent
@onready var pause_menu = $PauseMenuParent/PauseMenu


func _ready() -> void:
	pause_menu.hide()
	var quit_call := Callable(self, "quit_game")
	MessageBus.game_quit.connect(quit_call)

func _process(_delta) -> void:
	if Input.is_action_just_pressed("pause"):
		toggle_pause()

## Deletes old level and instantiates the specified new level.
func change_level(new_level: PackedScene) -> void:
	current_scene_parent.get_child(0).queue_free()
	current_scene_parent.add_child(new_level.instantiate())

## Quits the game.
func quit_game() -> void:
	get_tree().quit()

func toggle_pause() -> void:
	pause_menu.visible = not pause_menu.visible
