extends Control

signal move_up
signal move_left
signal move_down
signal move_right

signal stop_up
signal stop_left
signal stop_down
signal stop_right


func _on_ButtonUp_button_down():
	emit_signal("move_up")


func _on_ButtonUp_button_up():
	emit_signal("stop_up")


func _on_ButtonLeft_button_down():
	emit_signal("move_left")


func _on_ButtonLeft_button_up():
	emit_signal("stop_left")


func _on_ButtonDown_button_down():
	emit_signal("move_down")


func _on_ButtonDown_button_up():
	emit_signal("stop_down")


func _on_ButtonRight_button_down():
	emit_signal("move_right")


func _on_ButtonRight_button_up():
	emit_signal("stop_right")
