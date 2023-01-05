extends Area2D

var projectileSpeed = 400

signal changeScore

var ScoreBoard = preload("res://Source/Actors/ScoreText.tscn")



func _physics_process(delta: float) -> void:
	position.y -= projectileSpeed * delta
	

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func _on_PlayerLaser_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bunker"):
		area.queue_free()
		queue_free()
	if area.is_in_group("Enemy"):
		area.get_parent().vscore += 10
		area.queue_free()
		queue_free()
		




