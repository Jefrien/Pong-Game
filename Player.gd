extends KinematicBody2D

var speed = 400

func _physics_process(delta): 
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up_2p"):
		direction.y -= 1
	
	if Input.is_action_pressed("ui_down_2p"):
		direction.y += 1
		
	move_and_slide(direction * speed)
