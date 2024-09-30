@tool
extends PopochiuProp
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
# Remember to use command_fallback for unhandled items
func _on_item_used(_item: PopochiuInventoryItem) -> void:

	if _item == I.GlyphX and not Globals.remove_screw:
		I.GlyphX.remove()
		R.get_prop("Screw").hide()
		I.Screw.add()
		Globals.remove_screw = true
		if not Globals.move_scraps:
			await C.player.say("Tibs got metal thingy removed. Still need to find a way to get humans to open the door though.")
			await C.player.say("They seem to only do it when a rat takes a long nap.")
	else:
		E.command_fallback() # must be called for unhandled items

# When an inventory item linked to this Prop (link_to_item) is removed from
# the inventory (i.e. when it is used in something that makes use of the object).
func _on_linked_item_removed() -> void:
	pass

# When an inventory item linked to this Prop (link_to_item) is discarded from
# the inventory (i.e. when the player throws the object out of the inventory).
func _on_linked_item_discarded() -> void:
	pass


#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
func on_look_at() -> void:
	await C.player.walk_to_clicked()
	await C.player.face_clicked()
	if Globals.looked_at_cage and Globals.bottle_rat_dead and not Globals.remove_screw and not Globals.move_scraps:
		await C.player.say("Tibs still need remove metal thingy and find a way to get humans to open that door. They seem to only do it when a rat takes a long nap.")
	elif not Globals.remove_screw and not Globals.move_scraps:
		await C.player.say("Head became noisy after human pulled me through door. Maybe I can get outside again?")
		await C.player.say("Hmm. This metal thingy is loose. If Tibs remove it, maybe get friends out of here.")
		await C.player.face_down()
		if not Globals.looked_at_cage:
			Globals.looked_at_cage = true
	elif Globals.remove_screw and not Globals.move_scraps:
		await C.player.say("Tibs still need to get humans to open door.")
		await C.player.say("They seem to only do it when rat takes long nap.")
	elif not Globals.remove_screw and Globals.move_scraps:
		await C.player.say("Scraps is in position but still need to get metal thingy out…")


#endregion
