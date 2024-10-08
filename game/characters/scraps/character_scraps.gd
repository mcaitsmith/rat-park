@tool
extends PopochiuCharacter
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.

const Data := preload('character_scraps_state.gd')

var state: Data = load("res://game/characters/scraps/character_scraps.tres")


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
#func on_look_at() -> void:
	#pass
	
func on_talk_to() -> void:
	await C.player.walk_to_clicked()
	await C.player.face_clicked()
	if not Globals.got_battery:
		await C.Scraps.face_right()
		await C.player.say("What are you doing?")
		await C.Scraps.say("What’s it look like? I’m having a meal.")
		await C.Scraps.face_left()
		await C.Scraps.play_animation("walk")
		C.Scraps.play_animation("smallshock")
		# shock SFX
		await E.am.play_sound_cue("shock")
		await D.DialogCheese.start()
	elif not Globals.scraps_dead:
		await C.Scraps.say("Can’t talk….*munch*…Busy…")
		C.Scraps.play_animation("chew")

func on_push() -> void:
	await self.move_body()
	
func on_pull() -> void:
	await self.move_body()

func move_body() -> void:
	if Globals.scraps_dead:
		Globals.move_scraps = true
		Globals.player_pos = "move_scraps"
		await C.player.walk_to_clicked()
		await C.player.face_clicked()
		await E.goto_room("MainCage")


#endregion
