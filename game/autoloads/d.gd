@tool
extends "res://addons/popochiu/engine/interfaces/i_dialog.gd"

# classes ----
const PDDialogBottle := preload("res://game/dialogs/dialog_bottle/dialog_dialog_bottle.gd")
const PDDialogWheel := preload("res://game/dialogs/dialog_wheel/dialog_dialog_wheel.gd")
const PDDialogGlyph := preload("res://game/dialogs/dialog_glyph/dialog_dialog_glyph.gd")
const PDDialogGlyph2 := preload("res://game/dialogs/dialog_glyph_2/dialog_dialog_glyph_2.gd")
const PDDialogCheese := preload("res://game/dialogs/dialog_cheese/dialog_dialog_cheese.gd")
const PDDialogFinal := preload("res://game/dialogs/dialog_final/dialog_dialog_final.gd")
# ---- classes

# nodes ----
var DialogBottle: PDDialogBottle : get = get_DialogBottle
var DialogWheel: PDDialogWheel : get = get_DialogWheel
var DialogGlyph: PDDialogGlyph : get = get_DialogGlyph
var DialogGlyph2: PDDialogGlyph2 : get = get_DialogGlyph2
var DialogCheese: PDDialogCheese : get = get_DialogCheese
var DialogFinal: PDDialogFinal : get = get_DialogFinal
# ---- nodes

# functions ----
func get_DialogBottle() -> PDDialogBottle: return get_instance("DialogBottle")
func get_DialogWheel() -> PDDialogWheel: return get_instance("DialogWheel")
func get_DialogGlyph() -> PDDialogGlyph: return get_instance("DialogGlyph")
func get_DialogGlyph2() -> PDDialogGlyph2: return get_instance("DialogGlyph2")
func get_DialogCheese() -> PDDialogCheese: return get_instance("DialogCheese")
func get_DialogFinal() -> PDDialogFinal: return get_instance("DialogFinal")
# ---- functions

