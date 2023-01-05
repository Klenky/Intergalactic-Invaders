extends Node

signal max_changed(new_max)
signal changed(new_amount)
signal dead

export(int) var max_lives = 3 setget set_max

export(int) var current_lives = 3  setget set_current #max_lives

func _ready() -> void:
	_initialize()

func set_max(new_max):
	max_lives = new_max
	max_lives = max(1, new_max)
	emit_signal("max_changed", max_lives)
	
func set_current(new_value):
	current_lives = new_value
	current_lives = clamp(current_lives, 0, max_lives)
	emit_signal("changed", current_lives)
	
	if current_lives == 0:
		emit_signal("dead")
		print("Dead")
		get_parent().queue_free()
		
func _initialize():
	emit_signal("max_changed", max_lives)
	emit_signal("changed", current_lives)
