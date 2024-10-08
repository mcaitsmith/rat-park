extends PopochiuInventoryItem

const Data := preload('inventory_item_battery_state.gd')

var state: Data = load("res://game/inventory_items/battery/inventory_item_battery.tres")


#region Virtual ####################################################################################
# When the item is clicked in the inventory
func _on_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()


# When the item is right clicked in the inventory
func _on_right_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()


# When the item is middle clicked in the inventory
func _on_middle_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()


# When the item is clicked and there is another inventory item selected
func _on_item_used(_item: PopochiuInventoryItem) -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()
	# For example, you can make the player character say something when the Key item is used in this
	# item. Note that you have to change the name of the `_item` parameter to `item`.
#	if item == I.Key:
#		await C.player.say("I cannot combine them")


# Actions to excecute after the item is added to the Inventory
func _on_added_to_inventory() -> void:
	# Replace the call to super() to implement your code. This only
	# makes the default behavior to happen.
	super()


# Actions to excecute when the item is discarded from the Inventory
func _on_discard() -> void:
	# Replace the call to super() to implement your code. This only
	# makes the default behavior to happen.
	super()


#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:

func on_look_at() -> void:
	await C.Tibs.say("Shocky cylinder makes cheese unsafe?")
