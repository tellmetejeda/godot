extends KinematicBody2D


const aceleration = 70
const max_speed = 300
const jump_h = -900
const up = Vector2(0, -1)
const gravity = 40 

onready var sprite = $Sprite
onready var animationPLayer = $AnimationPlayer

var motion = Vector2()

func _physics_process(delta):
	motion.y += gravity
	var friction = false
	


if Input.is_action_pressed("ui_right"):
	sprite.flip_h = true
	aniamtionPlayer.play("walk")
	motion.x = min(motion.x + aceleration, max_speed)
elif Input.is_action_pressed("ui_left"):
	sprite.flip_h = false
	aniamtionPlayer.play("walk")
	motion.x = max(motion.x - aceleration, -max_speed)
else:
	animationPlayer.play("quieto")
	friction = true
	
	
if is_on_floor():
	
	if Input.is_action_just:pressed("ui_accept"):
		motion.y = jump_h
	if friction == true:
		motion.x = lerp(motion.x 0, 0.5)
else:
	if friction == true:
		motion.x = lerp(motion.x 0, 0.01)
motion= move_and_slide(motion, up)
		
