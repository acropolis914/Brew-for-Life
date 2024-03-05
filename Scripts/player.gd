extends Node2D

var speed = 400
var screen_size
var facing := "down"
var jumping = false


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size= get_viewport_rect().size
	$AnimatedSprite2D.animation = "walk_down"


func _process(delta):
	var velocity= Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_just_pressed("jump"):
		jump(facing)
	if Input.is_action_just_pressed("sprint"):
		speed = speed * 1.5
	if Input.is_action_just_released("sprint"):
		speed = 400
	
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play("",2)
	elif velocity.length() == 0 && !jumping:
		$AnimatedSprite2D.stop()
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO,screen_size)
	

	if velocity.x > 0:
		$AnimatedSprite2D.animation = "walk_right"
		facing = "right"
	elif velocity.x < 0:
		$AnimatedSprite2D.animation = "walk_left"
		facing = "left"
	elif velocity.y > 0:
		$AnimatedSprite2D.animation = "walk_down"
		facing = "down"
	elif velocity.y < 0:
		$AnimatedSprite2D.animation = "walk_up"
		facing = "up"
		
func jump(facing):
	jumping = true
	var jumpface = "jump_" + facing
	print(jumpface)
	$AnimatedSprite2D.animation = jumpface
	$AnimatedSprite2D.play()
	await get_tree().create_timer(.5).timeout
	jumping = false
	var walkface = "walk_" +facing
	$AnimatedSprite2D.animation = walkface
	
func _on_body_entered(body):
	pass

	
