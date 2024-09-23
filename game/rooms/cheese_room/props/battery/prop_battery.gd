@tool
extends PopochiuProp
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.


#region Virtual ####################################################################################
# When the node is clicked
func _on_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	#E.command_fallback()
	# For example, you can make the player character walk to this prop, gaze at it, and then say
	# something:
	await C.player.walk_to_clicked()
	await C.player.face_clicked()

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
	E.command_fallback()
	# For example, you can make the player character say something when the Key item is used in this
	# prop. Note that you have to change the name of the `_item` parameter to `item`.
		#		await C.player.say("I can't do that")


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
	if Globals.talk_scraps and not Globals.got_battery:
		await C.player.say("It’s one of those shocky cylinders.")
		
func on_pick_up() -> void:
	await self.check_battery()
	
func on_pull() -> void:
	await self.check_battery()
	
func on_use() -> void:
	await self.check_battery()
	
func check_battery() -> void:
	await C.player.walk_to_clicked()
	await C.player.face_clicked()
	if Globals.talk_scraps and not Globals.got_battery:
		await C.player.say("I think I’ll take it.")
		R.get_prop("Battery").visible = false
		I.Battery.add()
		Globals.got_battery = true
		await C.Scraps.face_left()
		await C.Scraps.say("*munch* *munch* *nom* *nom*")
		C.Scraps.play_animation("chew")



#endregion
