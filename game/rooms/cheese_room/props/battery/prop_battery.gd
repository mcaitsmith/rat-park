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
func _on_item_used(_item: PopochiuInventoryItem) -> void:
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
	await C.player.say("This cylinder is shocky.")
		
func on_pick_up() -> void:
	await C.player.walk_to_clicked()
	await C.player.face_clicked()
	await C.player.say("Argh. Tibs need to get it out first.")
	
func on_pull() -> void:
	await self.check_battery()
	
func check_battery() -> void:
	await C.player.walk_to_clicked()
	await C.player.face_clicked()
	if Globals.talk_scraps:
		await C.player.say("Tibs got it.")
		R.get_prop("Battery").hide()
		R.get_hotspot("Socket").show()
		I.Battery.add()
		await C.Scraps.face_left()
		await C.Scraps.say("*munch* *munch* *nom* *nom*")
		C.Scraps.play_animation("chew")
	else: 
		await C.player.say("Tibs not sure why he need it yet.")
		# don't like this. Is there a better way to block this action prior to talkingt to scraps.


#endregion
