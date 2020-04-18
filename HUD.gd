extends CanvasLayer

signal replay

func show_replay():
	$ReplayButton.show()

func _on_Button_pressed():
	$ReplayButton.hide()
	emit_signal("replay")
