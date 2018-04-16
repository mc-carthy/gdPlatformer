extends KinematicBody2D

const UP = Vector2(0, -1)
const MAX_SPEED = 200
const ACC = 50
const GRAVITY = 20
const JUMP_SPEED = -500

var motion = Vector2(0, 0)

func _physics_process(delta):
	var friction = false
	if Input.is_action_pressed('ui_right'):
		motion.x = min(motion.x + ACC, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play('run')
	elif Input.is_action_pressed('ui_left'):
		motion.x = max(motion.x - ACC, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play('run')
	else:
		friction = true
		$Sprite.play('idle')
	
	if is_on_floor():
		if Input.is_action_just_released('ui_up'):
			motion.y = JUMP_SPEED
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		$Sprite.play('jump')
		motion.y += GRAVITY
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	move_and_slide(motion, UP)
	pass

