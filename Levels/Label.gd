extends Label

signal changeScore

var score = 0

func _process(delta: float) -> void:
	text = "Score: %s" % score
	if score == 550:
		get_tree().change_scene("res://Source/Levels/GameOverScreenWin.tscn")
	

	
