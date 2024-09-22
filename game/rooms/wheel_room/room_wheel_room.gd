@tool
extends PopochiuRoom

const Data := preload('room_wheel_room_state.gd')

var state: Data = load("res://game/rooms/wheel_room/room_wheel_room.tres")


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	#C.Zippy.play_animation("walk_wheel")
	R.get_prop("Wheel").find_child("AnimationPlayer").play("wheelmove")
	R.get_prop("WheelFront").find_child("AnimationPlayer").play("wheelmove")
	A.wheelrattle.loop = true
	E.am.play_sound_cue("wheelrattle")
	C.Zippy.face_left()
	if E.used_highlighter:
		await C.Lightbulb.play_animation("highlight_on")
		await C.Lightbulb.pause_animation()
	if E.player_pos == "right":
		#await C.player.teleport_to_hotspot("RightHole")
		await C.player.face_left()
	elif E.player_pos == "left":
		await C.player.teleport_to_hotspot("LeftHole")
		await C.player.face_right()
	#pass


# What happens when the room changing transition finishes. At this point the room
# is visible.
func _on_room_transition_finished() -> void:
	# You can use await E.queue([]) to excecute a sequence of instructions
	pass


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func _on_room_exited() -> void:
	E.am.stop("wheelrattle")
	A.wheelrattle.stop()
	#pass


#endregion
