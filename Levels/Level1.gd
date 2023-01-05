extends Node2D

const GameOverScreen = preload("res://Source/Levels/GameOverScreen.tscn")

onready var playerHealth = $Player/Lives
onready var healthBar = $TextureProgress



func _ready() -> void:
	
	
	playerHealth.connect("changed", healthBar, "set_value")
	playerHealth.connect("max_changed", healthBar, "set_max")
	
	
	playerHealth._initialize()	
	
func _process(delta: float) -> void:
		if $AudioStreamPlayer.playing == false:
			$AudioStreamPlayer.play()
		


func _on_Lives_dead() -> void:
	var game_over = GameOverScreen.instance()
	if playerHealth.current_lives == 0:
		add_child(game_over)
		get_tree().paused = true

