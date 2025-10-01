extends PlayerState

func _enter() -> void:
	#Change animation to fall
	obj.change_animation("fall")

func _update(_delta: float) -> void:
	#Control moving
	control_moving()
	print("Update in fall state")
	
	control_jump()
	#Slow falling on wall
	if obj.is_on_wall():
		obj.velocity.y = obj.gravity * 0.1
	  
	#If on floor change to idle if not moving and not jumping
	if (obj.is_on_floor()):
		change_state(fsm.states.idle)
