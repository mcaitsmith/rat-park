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
	E.command_fallback() # must be called for unhandled items


#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
	
func on_open() -> void:
	await C.player.say("It's already open.")
	
func on_walk_to() -> void:
	await self.check_hole()
	
func on_use() -> void:
	await self.check_hole()
	
func check_hole() -> void:
	await C.player.walk_to_clicked()
	await C.player.face_clicked()
	Globals.player_pos = "right" # set start position in next room
	await E.goto_room("CheeseRoom")


#endregion
