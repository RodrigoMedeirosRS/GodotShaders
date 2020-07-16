extends Spatial

func _on_Button_button_down():
	get_parent().get_child(0).show()
	queue_free()