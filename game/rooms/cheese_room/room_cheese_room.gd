@tool
extends PopochiuRoom

const Data := preload('room_cheese_room_state.gd')

var state: Data = load("res://game/rooms/cheese_room/room_cheese_room.tres")


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	await C.Scraps.face_left()
	if not I.Battery.in_inventory:
		R.get_prop("Battery").show()
		R.get_hotspot("Socket").hide()
	else:
		R.get_prop("Battery").hide()
		R.get_hotspot("Socket").show()
	if Globals.scraps_dead and not Globals.move_scraps:
		await C.Scraps.play_animation("dead")
		await C.Scraps.pause_animation()
	elif Globals.move_scraps:
		C.Scraps.hide()
	if Globals.scraps_dead:
		R.get_prop("Battery").clickable = false
	if Globals.player_pos == "right":
		await C.player.teleport_to_hotspot("RightHole")
		await C.player.face_left()
	elif Globals.player_pos == "left":
		#await C.player.teleport_to_hotspot("LeftHole")
		await C.player.face_right()
	#pass


# What happens when the room changing transition finishes. At this point the room
# is visible.
func _on_room_transition_finished() -> void:
	# You can use await E.queue([]) to excecute a sequence of instructions
	if Globals.got_battery and not Globals.scraps_dead:
		await C.Scraps.say("*munch* *munch* *nom* *nom*")
		C.Scraps.play_animation("chew")
	#pass


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func _on_room_exited() -> void:
	pass


#endregion
