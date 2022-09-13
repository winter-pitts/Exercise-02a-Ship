extends KinematicBody2D

var velocity = Vector2.ZERO

var rotation_speed = 4.5
var speed = 0.085
var max_speed = 10

func _ready():
	pass 


func _physics_process(_delta):
	position = position + velocity
	velocity = velocity.normalized() * clamp(velocity.length(), 0, max_speed)
	
	$Exhaust.hide()
	if Input.is_action_pressed("forward"):
		velocity = velocity + Vector2(0,-speed).rotated(rotation)
		$Exhaust.show()
	if Input.is_action_pressed("back"):
		velocity = velocity + Vector2(0,+speed).rotated(rotation)
	if Input.is_action_pressed("left"):
		rotation_degrees = rotation_degrees - rotation_speed
	if Input.is_action_pressed("right"):
		rotation_degrees = rotation_degrees + rotation_speed
	
	
	if position.x > 1024:
		position.x = 0
	if position.x < 0:
		position.x = 1024
		
	if position.y > 600:
		position.y = 0
	if position.y < 0:
		position.y = 600
