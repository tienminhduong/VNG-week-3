extends PlayerState

func _enter() -> void:
	#Change animation to run
	obj.change_animation("run")

func _update(delta: float):
	print("Update in run called")
	#Control jump
	control_jump()
	#Control moving and if not moving change to idle
	control_moving()
	if (obj.velocity.x == 0):
		change_state(fsm.states.idle)
	#If not on floor change to fall
	if not obj.is_on_floor():
		change_state(fsm.states.fall)
