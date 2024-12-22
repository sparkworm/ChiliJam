extends Control

func _on_quit_btn_pressed():
	MessageBus.game_quit.emit()
