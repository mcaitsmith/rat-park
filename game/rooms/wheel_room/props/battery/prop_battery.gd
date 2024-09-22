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
#	if item == I.Key:
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
	if not E.used_highlighter:
		await C.player.say("Ooo it’s hot. Staticky.")
	else:
		await C.player.say("Ooo Yellow.")
	
func on_use() -> void:
	await self.check_battery()
	
func on_pick_up() -> void:
	await self.check_battery()
	
func on_pull() -> void:
	await self.check_battery()
	
func check_battery() -> void:
	await C.player.walk_to_clicked()
	await C.player.face_clicked()
	if not E.used_highlighter:
		R.get_prop("Wheel").find_child("AnimationPlayer").stop()
		R.get_prop("WheelFront").find_child("AnimationPlayer").stop()
		C.Zippy.get_node("AnimationPlayer").get_animation("idle").track_set_enabled(0,false)
		C.Zippy.get_node("AnimationPlayer").get_animation("idle").track_set_enabled(1,true)
		C.Zippy.get_node("AnimationPlayer").get_animation("talk").track_set_enabled(0,false)
		C.Zippy.get_node("AnimationPlayer").get_animation("talk").track_set_enabled(1,true)
		await E.queue([
			await R.current.get_prop("Battery").queue_disable(),
			await C.Lightbulb.queue_play_animation("off"),
			await C.Lightbulb.queue_pause_animation(),
			await C.Zippy.queue_walk_to_marker("ZippyWalkTo"),
			await C.player.queue_walk_to_marker("TibsBackTo"),
			await C.Zippy.queue_walk_to_prop("Battery"),
			await R.current.get_prop("Battery").queue_enable(),
			await C.Lightbulb.queue_play_animation("on"),
			await C.Lightbulb.queue_pause_animation(),
			await C.Zippy.queue_say("Gotta keep yellow! Zippy run fast!"),
			await C.Zippy.queue_walk_to_marker("ZippyWheel"),
			await C.Zippy.queue_face_left()
		])
		R.get_prop("Wheel").find_child("AnimationPlayer").play("wheelmove")
		R.get_prop("WheelFront").find_child("AnimationPlayer").play("wheelmove")
		C.Zippy.get_node("AnimationPlayer").get_animation("idle").track_set_enabled(1,false)
		C.Zippy.get_node("AnimationPlayer").get_animation("idle").track_set_enabled(0,true)
		C.Zippy.get_node("AnimationPlayer").get_animation("talk").track_set_enabled(1,false)
		C.Zippy.get_node("AnimationPlayer").get_animation("talk").track_set_enabled(0,true)
		#C.Zippy.play_animation("walk_wheel")
	elif not E.charged_battery:
		C.player.say("Now to just swipe the metal box…")
		await E.queue([
			await R.current.get_prop("Battery").queue_disable(),
			await C.Lightbulb.queue_play_animation("highlight_off"),
			await C.Lightbulb.queue_pause_animation(),
			await E.queue_wait(1.0),
			await R.current.get_prop("Battery").queue_enable(),
			await C.Lightbulb.queue_play_animation("highlight_on"),
			await C.Lightbulb.queue_pause_animation()
		])
		E.charged_battery = true


#endregion
