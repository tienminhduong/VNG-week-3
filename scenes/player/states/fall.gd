extends PlayerState

var on_wall_slow_falling_multiplier = 0.1

func _enter() -> void:
	#Change animation to fall
	obj.change_animation("fall")

func _update(_delta: float) -> void:
	#Control moving
	control_moving()
	
	#Slow falling on wall
	if obj.is_on_wall():
		obj.velocity.y = obj.gravity * on_wall_slow_falling_multiplier
		obj.position.x -= obj.direction

	control_jump()
	  
	#If on floor change to idle if not moving and not jumping
	if (obj.is_on_floor()):
		change_state(fsm.states.idle)
