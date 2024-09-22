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
			await C.Rat2.say("Special juice make head hurty go away!")
			await C.Rat1.say("How can special juice be bad?")
			turn_off_options(["Opt1"])
			turn_on_options(["Opt2"])
		'Opt2':
			await C.Rat2.say("Wrong!")
			await C.Rat1.say("Wrong and biased!")
			turn_off_options(["Opt2"])
			turn_on_options(["Opt3"])
		'Opt3':
			await C.Rat2.say("Outside world bad.")
			await C.Rat1.say("Special juice good.")
			turn_off_options(["Opt3"])
			turn_on_options(["Opt4"])
		'Opt4':
			await C.Rat2.say("Did he say…")
			await C.Rat1.say("More?...")
			await C.Rat2.say("Outside??")
			await C.Rat1.say("Go Go Go!!")
			C.Rat1.ignore_walkable_areas = true
			C.Rat2.ignore_walkable_areas = true
			C.player.ignore_walkable_areas = true
			await C.Rat1.walk_to_marker("CageExit")
			await C.Rat1.disable()
			await C.Rat2.walk_to_marker("CageExit")
			await C.Rat2.disable()
			await C.player.walk_to_marker("CageExit")
			await C.player.disable()
			await C.Hand.say("Scientist 1: Oh god they’re escaping! Stop them!")
			await C.Hand.say("Scientist 2: They’re everywhere!")
			await C.Hand.say("Scientist 1: They’re heading towards the ventilation system!")
			await C.Hand.say("Scientist 2: We are so fired for this!")
			await E.goto_room("End")
			stop()
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
