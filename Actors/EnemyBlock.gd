extends Area2D


var speed = 20
export var vscore = 0
export var num = -1
export var willDrop = 0
onready var movementTimer = $MovementTimer
onready var waitTimer = $WaitTImer

func _physics_process(delta: float) -> void:
	if num == -1 and movementTimer.is_stopped():
		position.x = position.x - speed
		movementTimer.start()
	if num == 1 and movementTimer.is_stopped():
		position.x = position.x + speed
		movementTimer.start()
	if willDrop == 1 and waitTimer.is_stopped():
		waitTimer.start()
		position.y = position.y + 30
		willDrop = 0
		movementTimer.wait_time = movementTimer.wait_time - 0.15
		
