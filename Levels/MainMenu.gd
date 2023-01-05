extends CanvasLayer


func _on_Button_pressed() -> void:
	get_tree().change_scene("res://Source/Levels/Level1.tscn")


func _on_Button2_pressed() -> void:
	get_tree().change_scene("res://Source/Levels/Credits.tscn")

func _process(delta: float) -> void:
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
