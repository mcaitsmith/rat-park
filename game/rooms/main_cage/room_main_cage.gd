@tool
extends PopochiuRoom

const Data := preload('room_main_cage_state.gd')

var state: Data = load("res://game/rooms/main_cage/room_main_cage.tres")

#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	A.wheelrattle.loop = false
	if A.wheelrattle.is_playing():
		A.wheelrattle.stop()
		E.am.stop("wheelrattle")
	if not Globals.start:
		C.player.visible = true
		E.gui.visible = true
	if not Globals.move_scraps:
		C.Scraps.disable()
	else:
		C.Scraps.enable()
		await C.Scraps.teleport_to_marker("ScrapsPos")
		await C.Scraps.play_animation("dead")
		await C.Scraps.pause_animation()
		
	if Globals.bottle_rat_dead == true:
		await C.Rat1.disable()
	else:
		await C.Rat1.face_left()
	if Globals.player_pos == "right":
		await C.player.teleport_to_hotspot("RightHole")
		await C.player.face_left()
	elif Globals.player_pos == "left":
		await C.player.teleport_to_hotspot("LeftHole")
		await C.player.face_right()
	elif Globals.player_pos == "move_scraps":
		await C.player.teleport_to_marker("TibsPos")
		await C.player.face_right()

	#pass


# What happens when the room changing transition finishes. At this point the room
# is visible.
func _on_room_transition_finished() -> void:
	# You can use await E.queue([]) to excecute a sequence of instructions
	if not Globals.start:
		C.player.can_move = false
		await E.am.play_sound_cue("squeak")
		await E.wait(0.5)
		await E.am.play_sound_cue("squeak")
		await E.wait(0.25)
		await E.am.play_sound_cue("squeak")
		#await E.wait(1.0)
		#await C.Rat2.say("SQUEAK!!")
		#E.am.play_sound_cue("squeak")
		#await C.player.say("SQUEAK!!!")
		await E.queue([
			#await E.am.play_sound_cue("squeak"),
			await E.queue_wait(1.0),
			#await C.Rat1.queue_say("SQUEAK!"),
			#await E.am.play_sound_cue("squeak"),
			##await E.wait(0.25),
			#await C.Rat2.queue_say("SQUEAK!!"),
			#await E.am.play_sound_cue("squeak"),
			##await E.wait(1.0),
			#await C.player.queue_say("SQUEAK!!!"),
			await R.get_prop("CageDoor").queue_disable(),
			await C.Hand.queue_walk_to_marker("PickupPoint"),
			await C.player.queue_disable(),
			await C.Hand.queue_walk_to_marker("AboveCage"),
			await C.Hand.queue_say("Scientist 1: Prepping compound XC-146 into the delivery syringe."),
			await C.Hand.queue_say("Scientist 2: Restraining specimen, Tibs."),
			await C.Hand.queue_say("Scientist 1: Preparing to deliver compound."),
			await C.Hand.queue_say("Scientist 2: What’s that… Hey! Stupid rat is peeing on me!"),
			await C.Hand.queue_say("Scientist 1: Oh… that is…unfortunate."),
			await C.Hand.queue_say("Scientist 2: Just inject the compound into this little idiot so I can wash my hands.")
		])
		await E.am.play_sound_cue("injection")
		await E.wait(2.0)
		await C.Hand.say("Scientist 1: Compound has been…delivered directly into the frontal cortex.")
		await C.Hand.say("Scientist 1: Let's check back in three hours to monitor intellectual development.")
		await C.Hand.say("Scientist 2: Stupid rat…")
		await E.queue([
			await C.Hand.queue_walk_to_marker("PickupPoint"),
			await C.player.queue_enable(),
			await C.Hand.queue_walk_to_marker("AboveCage"),
			await R.get_prop("CageDoor").queue_enable(),
			await E.queue_wait(1.0),
			await C.player.queue_face_left(),
			await C.player.queue_say("Squeak. Squeak. Sque- ow. Head hurts. Why head hurt?"),
			await C.player.queue_say("Head. Noisy. Why Tibs noisy head?")
		])
		C.player.can_move = true
		C.player.get_node("AnimationPlayer").get_animation("idle").track_set_enabled(0,false)
		C.player.get_node("AnimationPlayer").get_animation("idle").track_set_enabled(1,true)
		C.player.get_node("AnimationPlayer").get_animation("talk").track_set_enabled(0,false)
		C.player.get_node("AnimationPlayer").get_animation("talk").track_set_enabled(1,true)
		Globals.start = true


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func _on_room_exited() -> void:
	pass

#endregion
