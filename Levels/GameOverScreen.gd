extends CanvasLayer





func _on_Button_pressed() -> void:
	get_tree().change_scene("res://Source/Levels/Level1.tscn")
	get_tree().paused = false


func _on_Button2_pressed() -> void:
	get_tree().change_scene("res://Source/Levels/MainMenu.tscn")
