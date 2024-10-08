@tool
extends PopochiuHotspot
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.


#region Virtual ####################################################################################
# When the node is clicked
func _on_click() -> void:
	E.command_fallback() # must be called for unhandled 9 verbs

func _on_double_click() -> void:
	E.command_fallback()

# When the node is right clicked
func _on_right_click() -> void:
	E.command_fallback()

# When the node is middle clicked
func _on_middle_click() -> void:
	E.command_fallback()


# When the node is clicked and there is an inventory item selected
func _on_item_used(_item: PopochiuInventoryItem) -> void:
	
	if _item == I.GlyphW:
		if I.HighlighterCap.in_inventory && not I.HighlighterTip.in_inventory:
			await C.player.say("This should cut it free.")
			R.get_prop("HighlighterTip").hide()
			I.HighlighterTip.add()
		elif I.HighlighterTip.in_inventory:
			await C.player.say("There's nothing more to cut.")
		else:
			E.command_fallback()
	elif _item == I.GlyphA || _item == I.GlyphX:
		await C.player.say("Perhaps another glyph would be more useful.")
	elif _item == I.HighlighterCap || I.HighlighterTip:
		await C.player.say("I should keep it.")
	else:
		E.command_fallback() # must be called for unhandled items


#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
func on_look_at() -> void:
	await C.player.face_clicked()
	await C.player.say("Hmm. Yellow.")
	
func on_pick_up() -> void:
	await C.player.walk_to_clicked()
	await C.player.face_clicked()
	if not I.HighlighterTip.in_inventory:
		C.player.say("Maybe Tibs get another way.")
	else:
		E.command_fallback()

func on_open() -> void:
	if not I.HighlighterCap.in_inventory:
		await C.player.walk_to_clicked()
		await C.player.face_clicked()
		R.get_prop("HighlighterCap").hide()
		I.HighlighterCap.add()
		C.player.say("It's open, but now what?")
	else:
		C.player.say("Tips already open it.")
	
#endregion
