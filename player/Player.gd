extends KinematicBody2D

const GRAVITY = 30
const SPEED = 300
const JUMP = -500
const RESISTANCE = Vector2(0,-1)

var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY 
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$polygons.scale.x = 1
		$polygons/AnimationPlayer.play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$polygons.scale.x = -1
		$polygons/AnimationPlayer.play("run")
	else:
		motion.x = 0
		$polygons/AnimationPlayer.play("idle")
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP
	
	motion = move_and_slide(motion, RESISTANCE) # move_and_slide never will have a bigger value than motion