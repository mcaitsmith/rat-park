@tool
extends PopochiuHotspot
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.


#region Virtual ####################################################################################
# When the node is clicked
func _on_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	E.command_fallback()

func _on_double_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	E.command_fallback()

# When the node is right clicked
func _on_right_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	E.command_fallback()

# When the node is middle clicked
func _on_middle_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()

# When the node is clicked and there is an inventory item selected
func _on_item_used(_item: PopochiuInventoryItem) -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()
	
	# Add logic to use battery with cheese here


#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
func on_look_at() -> void:
	await self.check_cheese()
	
func on_pick_up() -> void:
	await self.check_cheese()
	
func on_push() -> void:
	await self.check_cheese()
	
func on_pull() -> void:
	await self.check_cheese()
	
func on_use() -> void:
	await self.check_cheese()
	
func check_cheese() -> void:
	await C.player.walk_to_clicked()
	await C.player.face_right()
	if not Globals.scraps_dead:
		await C.Scraps.say("Don’t even think about it, runt!")


#endregion
