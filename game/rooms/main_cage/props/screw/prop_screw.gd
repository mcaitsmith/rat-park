@tool
extends PopochiuProp
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.


#region Virtual ####################################################################################
# When the node is clicked
func _on_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()
	# For example, you can make the player character walk to this prop, gaze at it, and then say
	# something:
	#await C.player.walk_to_clicked()
	#await C.player.face_clicked()
#	await C.player.say("Not picking that up!")


func _on_double_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	E.command_fallback()
	# For example, you could make the player instantly do something instead of walking there first


# When the node is right clicked
func _on_right_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()
	# For example, you can make the player character gaze at this prop and then say something:
#	await C.player.face_clicked()
#	await C.player.say("A deck of cards")


# When the node is middle clicked
func _on_middle_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()


# When the node is clicked and there is an inventory item selected
func _on_item_used(_item: PopochiuInventoryItem) -> void:
	# Replace the call to E.command_fallback() to implement your code.
	#E.command_fallback()
	# For example, you can make the player character say something when the Key item is used in this
	# prop. Note that you have to change the name of the `_item` parameter to `item`.
	if _item == I.GlyphX and not E.remove_screw:
		I.GlyphX.remove()
		R.get_prop("Screw").hide()
		I.Screw.add()
		E.remove_screw = true
		if not E.move_scraps:
			await C.player.say("I got the screw removed. Still need to find a way to get humans to open the door though.")
			await C.player.say("They seem to only do it when a rat takes a long nap.")


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
	if E.looked_at_cage and E.bottle_rat_dead and not E.remove_screw and not E.move_scraps:
		await C.player.say("I still need remove that screw and find a way to get humans to open that door. They seem to only do it when a rat takes a long nap.")
	elif not E.remove_screw and not E.move_scraps:
		await C.player.say("Head became noisy after human pulled me through door. Maybe I can get outside again?")
		await C.player.say("Hmm. This screw looks like it could come out easily. Maybe Tibs needs a tool?")
		await C.player.face_down()
		if not E.looked_at_cage:
			E.looked_at_cage = true
	elif E.remove_screw and not E.move_scraps:
		await C.player.say("I got the screw removed. Still need to find a way to get humans to open the door though.")
		await C.player.say("They seem to only do it when a rat takes a long nap.")
	elif not E.remove_screw and E.move_scraps:
		await C.player.say("Scraps is in position but I still need to get that screw taken out…")


#endregion
