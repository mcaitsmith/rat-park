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
			await C.Nibbles.say("What a stupid question.")
		'Opt2':
			await C.Nibbles.say("Sure. What glyph do you want?")
			var opt2: PopochiuDialogOption = await D.show_inline_dialog([
				"w.", "A.", "X.","Q."
			]		)
			match opt2.id:
				"0":
					await C.player.say("w.")
					await C.Nibbles.say("Sure thing.")
					I.GlyphW.add()
					E.got_glyph1 = true
					stop()
				"1":
					await C.player.say("A.")
					await C.Nibbles.say("Sure thing.")
					I.GlyphA.add()
					E.got_glyph1 = true
					stop()
				"2":
					await C.player.say("X.")
					await C.Nibbles.say("Sure thing.")
					I.GlyphX.add()
					E.got_glyphX = true
					E.got_glyph1 = true
					stop()
				"3":
					await C.player.say("Q.")
					await C.Nibbles.say("I would never make such a cursed symbol.")
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
