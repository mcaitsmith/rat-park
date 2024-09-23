@tool
extends PopochiuDialog

#region Virtual ####################################################################################
func _on_start() -> void:
	# One can put here something to excecute before showing the dialog options.
	# E.g. Make the PC to look at the character which it will talk to, walk to
	# it, and say something (or make the character say something):
#	await C.player.face_clicked()
#	await C.player.say("Hi")
#	await C.Popsy.say("Oh! Hi...")
	# (!) It MUST always use an await
	await E.get_tree().process_frame


func _option_selected(opt: PopochiuDialogOption) -> void:
	# You can make the player character say the selected option with:
	await D.say_selected()
	
	# Use match to check which option was selected and excecute something for
	# each one
	match opt.id:
		'Opt1':
			await C.Rat1.say("Special juice make the head noises quiet!")
			await C.Rat2.say("Need more! Need more!")
		'Opt2':
			await C.Rat1.say("Where else go?")
			await C.Rat2.say("Water is here! No special juice out there!")
			await C.Rat1.say("If go then head noises get loud, stupid rat.")
		'Opt3':
			await C.Rat1.say("Special juice not bad!")
			await C.Rat2.say("Special juice better than water! If Tibs weren’t stupid, Tibs would know that!")
			await C.Rat1.say("Me drink more special juice because Tibs say that!")
			Globals.bottle_rat_dead = true
			await E.queue([
				await C.Rat1.queue_face_left(),
				await E.queue_wait(1.0),
				# play drinking SFX here?
				await C.Rat1.queue_walk_to_prop("Screw"),
				await C.player.queue_face_right(),
				await C.Rat1.queue_say("Getting tired…head feel good. Chest feel good."),
				await C.Rat1.queue_say("Rat take nap now…")
			])
			E.am.play_sound_cue("thump")
			await C.Rat1.play_animation("dead")
			await C.Rat1.pause_animation()
			await E.wait(1.0)
			await E.queue([
				await C.Hand.queue_say("Scientist 1: Ah, we’ve got another one!"),
				await R.get_prop("CageDoor").queue_disable(),
				await C.Hand.queue_walk_to_prop("Screw"),
				#await C.Rat1.queue_disable(),
				await C.Rat1.queue_teleport_to_marker("AboveCage"),
				await C.Hand.queue_walk_to_marker("AboveCage"),
				await R.get_prop("CageDoor").queue_enable(),
				await E.queue_wait(2.0),
				await C.player.queue_say("Door to outside open when a rat takes a long nap…maybe Tibs can use this…"),
				await queue_stop()
			])
			#stop()
		_:
			# By default close the dialog. Options won't show after calling
			# stop()
			stop()
	
	_show_options()


# Use this to save custom data for this PopochiuDialog when saving the game.
# The Dictionary must contain only JSON supported types: bool, int, float, String.
func _on_save() -> Dictionary:
	return {}


# Called when the game is loaded.
# This Dictionary should has the same structure you defined for the returned one in _on_save().
func _on_load(data: Dictionary) -> void:
	prints(data)


#endregion
