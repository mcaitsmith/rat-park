@tool
extends PopochiuRoom

const Data := preload('room_cheese_room_state.gd')

var state: Data = load("res://game/rooms/cheese_room/room_cheese_room.tres")


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	await C.Scraps.face_left()
	if not E.got_battery:
		R.get_hotspot("Socket").disable()
	elif not E.scraps_dead:
		R.get_hotspot("Socket").enable()
	if E.scraps_dead and not E.move_scraps:
		await C.Scraps.play_animation("dead")
		await C.Scraps.pause_animation()
	elif E.move_scraps:
		C.Scraps.disable()
	if E.got_battery and not E.scraps_dead:
		R.get_prop("Battery").visible = false
	elif E.scraps_dead:
		R.get_prop("Battery").visible = true
	if E.player_pos == "right":
		await C.player.teleport_to_hotspot("RightHole")
		await C.player.face_left()
	elif E.player_pos == "left":
		#await C.player.teleport_to_hotspot("LeftHole")
		await C.player.face_right()
	#pass


# What happens when the room changing transition finishes. At this point the room
# is visible.
func _on_room_transition_finished() -> void:
	# You can use await E.queue([]) to excecute a sequence of instructions
	if E.got_battery and not E.scraps_dead:
		await C.Scraps.say("*munch* *munch* *nom* *nom*")
		C.Scraps.play_animation("chew")
	#pass


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func _on_room_exited() -> void:
	pass


#endregion
