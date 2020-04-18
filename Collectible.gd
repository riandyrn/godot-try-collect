extends Area2D

signal collected

func _on_Collectible_area_entered(area):
	emit_signal("collected")
	queue_free()
