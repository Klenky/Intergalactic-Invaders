extends Area2D


var projectileSpeed = 100

func _physics_process(delta: float) -> void:
	position.y += projectileSpeed * delta

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()

func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bunker"):
		area.queue_free()
		queue_free()
	if area.is_in_group("PLaser"):
		area.queue_free()
		queue_free()
	
			


func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		body.get_child(4).current_lives -= 1
		queue_free()
		
