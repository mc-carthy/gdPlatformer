extends KinematicBody2D

const UP = Vector2(0, -1)

var motion = Vector2(0, 0)

func _physics_process(delta):
	if Input.is_action_pressed('ui_right'):
		motion.x = 200
		$Sprite.flip_h = false
		$Sprite.play('run')
	elif Input.is_action_pressed('ui_left'):
		motion.x = -200
		$Sprite.flip_h = true
		$Sprite.play('run')
	else:
		motion.x = 0
		$Sprite.play('idle')
	
	if is_on_floor():
		if Input.is_action_just_released('ui_up'):
			motion.y = -500
	else:
		$Sprite.play('jump')
		motion.y += 20
	move_and_slide(motion, UP)
	pass

