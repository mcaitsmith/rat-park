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
			await C.Scraps.say("Not unless you want to get crushed!")
		'Opt2':
			await C.Scraps.say("Incredibly. But I won’t let the cheese win!")
			await C.Scraps.face_left()
			await C.Scraps.play_animation("walk")
			C.Scraps.play_animation("smallshock")
			# shock SFX
			await E.am.play_sound_cue("shock")
		'Opt3':
			await C.Scraps.say("What do you know, stupid rat?")
			await C.player.say("Well, it looks like that cylinder over there is making it shocky.")
			await C.Scraps.say("How do you know that?")
			await C.player.say("Hmm. I’m not sure actually.")
			await C.Scraps.say("Sounds like you’re making stuff up.")
			Globals.talk_scraps = true
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
