extends KinematicBody2D
class_name Actor

var PlayerLaser = preload("res://Source/Actors/PlayerLaser.tscn")
var healthAnim = preload("res://Source/Actors/Health Bar.tscn")

onready var fireDelayTimer := $FireDelayTimer

export var speed: = Vector2(100, 1000)
export var fireDelay: float = 0.3
export var gravity: = 3000.0

var velocity: = Vector2(.00001, 0)
var turnTrig = 0

func shoot():
	fireDelayTimer.start(fireDelay)
	var laser = PlayerLaser.instance()
	owner.add_child(laser)
	laser.transform = $LaserStart.global_transform
	$LaserAudio.play()
	
func get_input():		
	if Input.is_action_just_pressed("shoot") and fireDelayTimer.is_stopped():
		shoot()
	if Input.is_action_pressed("move_left"):
		var collide = move_and_collide(velocity * -.07)
	if Input.is_action_pressed("move_right"):
		var collide = move_and_collide(velocity * .07)
	velocity = velocity.normalized() * speed

	
func _physics_process(delta: float) -> void:
	get_input()

	
