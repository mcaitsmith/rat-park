@tool
extends "res://addons/popochiu/engine/interfaces/i_room.gd"

# classes ----
const PRMainCage := preload("res://game/rooms/main_cage/room_main_cage.gd")
const PRWheelRoom := preload("res://game/rooms/wheel_room/room_wheel_room.gd")
const PRCultRoom := preload("res://game/rooms/cult_room/room_cult_room.gd")
const PRCheeseRoom := preload("res://game/rooms/cheese_room/room_cheese_room.gd")
const PRTitle := preload("res://game/rooms/title/room_title.gd")
const PREnd := preload("res://game/rooms/end/room_end.gd")
# ---- classes

# nodes ----
var MainCage: PRMainCage : get = get_MainCage
var WheelRoom: PRWheelRoom : get = get_WheelRoom
var CultRoom: PRCultRoom : get = get_CultRoom
var CheeseRoom: PRCheeseRoom : get = get_CheeseRoom
var Title: PRTitle : get = get_Title
var End: PREnd : get = get_End
# ---- nodes

# functions ----
func get_MainCage() -> PRMainCage: return get_runtime_room("MainCage")
func get_WheelRoom() -> PRWheelRoom: return get_runtime_room("WheelRoom")
func get_CultRoom() -> PRCultRoom: return get_runtime_room("CultRoom")
func get_CheeseRoom() -> PRCheeseRoom: return get_runtime_room("CheeseRoom")
func get_Title() -> PRTitle: return get_runtime_room("Title")
func get_End() -> PREnd: return get_runtime_room("End")
# ---- functions
