@tool
extends PopochiuRoom

const Data := preload('room_cult_room_state.gd')

var state: Data = load("res://game/rooms/cult_room/room_cult_room.tres")


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	await C.Nibbles.face_left()
	C.Nibbles.play_animation("chew")
	if Globals.player_pos == "right":
		await C.player.teleport_to_hotspot("RightHole")
		await C.player.face_left()
	elif Globals.player_pos == "left":
		await C.player.teleport_to_hotspot("LeftHole")
		await C.player.face_right()
	if Globals.got_highlighter:
		R.get_prop("HighlighterTip").hide()
	#pass


# What happens when the room changing transition finishes. At this point the room
# is visible.
func _on_room_transition_finished() -> void:
	# You can use await E.queue([]) to excecute a sequence of instructions
	await C.CultRat1.say("Oooo….Mmmmm…")
	await C.CultRat2.say("Wwwww….Qqqqqq…")
	await C.CultRat3.say("Xxxx…Lllll…")
	#pass


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func _on_room_exited() -> void:
	pass


#endregion
