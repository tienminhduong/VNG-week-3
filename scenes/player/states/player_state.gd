class_name PlayerState
extends FSMState

func _enter() -> void:
	pass

func _exit() -> void:
	pass

func _update(delta: float) -> void:
	pass

#Control moving and changing state to run
#Return true if moving
func control_moving() -> bool:
	var dir: float = Input.get_action_strength("right") - Input.get_action_strength("left")
	var is_moving: bool = abs(dir) > 0.1
	if is_moving:
		dir = sign(dir)
		obj.change_direction(dir)
		obj.velocity.x = obj.movement_speed * dir
		if obj.is_on_floor():		
			if Input.is_action_pressed("dash"):
				obj.velocity.x *= obj.dash_speed_multiplier
				change_state(fsm.states.dash)
			else:
				change_state(fsm.states.run)
		return true
	else:
		obj.velocity.x = 0
	return false

#Control jumping
#Return true if jumping
func control_jump() -> bool:
	if obj.jumpCount >= 2 and not obj.is_on_wall():
		return false
	
	#If jump is pressed change to jump state and return true
	if Input.is_action_just_pressed("jump"):
		obj.jumpCount += 1
		obj.jump()
		change_state(fsm.states.jump)
		return true
	return false
