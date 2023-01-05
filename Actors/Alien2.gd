extends Area2D

var num: = 0

var enemyLaser = preload("res://Source/Actors/EnemyLaser.tscn")

#onready var timer := $ShootTimer

func shoot():
	get_node("ShootTimer").start()
	var laser = enemyLaser.instance()
	owner.add_child(laser)
	laser.transform = $LaserStart.global_transform

func _process(delta: float) -> void:
	randomize()
	num = rand_range(0,1000)
	if num == 1 and get_node("ShootTimer").is_stopped():
		shoot()
		
		
func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.is_in_group("leftWall"):
		get_parent().num = 1
		get_parent().willDrop = 1
	if area.is_in_group("rightWall"):
		get_parent().num = -1
		get_parent().willDrop = 1
	if area.is_in_group("Bunker"):
		area.queue_free()


func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		body.get_child(4).current_lives = 0
