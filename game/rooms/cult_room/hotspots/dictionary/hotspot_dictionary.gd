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
func on_look_at() -> void:
	await self.check_dict()
	
func on_use() -> void:
	await self.check_dict()
	
func check_dict() -> void:
	await C.player.walk_to_clicked()
	await C.player.face_clicked()
	await C.player.say("Head noises tell me these symbols make sounds. And those sounds…")
	await C.player.say("Mean things?")
	await C.CultRat1.say("What? Heresy! These are sacred glyphs left behind by the gods.")
	await C.CultRat2.say("They teach us how to live the life best for us!")
	await C.CultRat3.say("This one tells us to drink more special juice!")
	await C.player.say("Well, alright, if you say so.")


#endregion
