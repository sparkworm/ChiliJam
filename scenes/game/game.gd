## Highest node, responsible for functions such as switching scenes
class_name Game
extends Node

@onready var current_scene_parent = $CurrentSceneParent
@onready var pause_menu = $PauseMenuParent/PauseMenu


func _ready() -> void:
	pause_menu.hide()
	var quit_call := Callable(self, "quit_game")
	MessageBus.game_quit.connect(quit_call)

func _process(delta) -> void:
	if Input.is_action_just_pressed("pause"):
		toggle_pause()

## Quits the game.
func quit_game() -> void:
	get_tree().quit()

func toggle_pause() -> void:
	pause_menu.visible = not pause_menu.visible
