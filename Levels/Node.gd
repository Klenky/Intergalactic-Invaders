extends Node

export var Nscore = 10

func _process(delta: float) -> void:
	get_node("ScoreLabel").score = get_child(0).vscore
