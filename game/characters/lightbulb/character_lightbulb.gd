@tool
extends PopochiuCharacter
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.

const Data := preload('character_lightbulb_state.gd')

var state: Data = load("res://game/characters/lightbulb/character_lightbulb.tres")


#region Virtual ####################################################################################
# When the room in which this node is located finishes being added to the tree
func _on_room_set() -> void:
	pass


# When the node is clicked
func _on_click() -> void:
	E.command_fallback()

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
	
	if _item == I.HighlighterTip:
		await C.player.walk_to_clicked()
		await C.player.face_left()
		I.HighlighterTip.remove()
		await C.Lightbulb.play_animation("highlight_on")
		await C.Lightbulb.pause_animation()
		Globals.used_highlighter = true
	else:
		E.command_fallback()


# Use it to play the idle animation for the character
func _play_idle() -> void:
	super()


# Use it to play the walk animation for the character
# target_pos can be used to know the movement direction
func _play_walk(target_pos: Vector2) -> void:
	super(target_pos)


# Use it to play the talk animation for the character
func _play_talk() -> void:
	super()


# Use it to play the grab animation for the character
func _play_grab() -> void:
	super()


# Called when the character stops moving
func _on_move_ended() -> void:
	pass


#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
func on_look_at() -> void:
	await C.player.walk_to_clicked()
	await C.player.face_left()
	await C.player.say("Hmm. Bright.")


#endregion
