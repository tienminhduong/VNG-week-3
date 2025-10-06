extends PlayerState


func _enter() -> void:
	obj.change_animation("dash")
	
func _update(delta: float) -> void:
	control_jump()
	control_moving()
	if (obj.velocity.x == 0):
		change_state(fsm.states.idle)
	#If not on floor change to fall
	if not obj.is_on_floor():
		change_state(fsm.states.fall)
	
