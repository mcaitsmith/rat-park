@tool
extends "res://addons/popochiu/engine/interfaces/i_inventory.gd"

# classes ----
const PIIHighlighterTip := preload("res://game/inventory_items/highlighter_tip/inventory_item_highlighter_tip.gd")
const PIIGlyphW := preload("res://game/inventory_items/glyph_w/inventory_item_glyph_w.gd")
const PIIGlyphX := preload("res://game/inventory_items/glyph_x/inventory_item_glyph_x.gd")
const PIIGlyphA := preload("res://game/inventory_items/glyph_a/inventory_item_glyph_a.gd")
const PIIGlyphT := preload("res://game/inventory_items/glyph_t/inventory_item_glyph_t.gd")
const PIIBattery := preload("res://game/inventory_items/battery/inventory_item_battery.gd")
const PIIScrew := preload("res://game/inventory_items/screw/inventory_item_screw.gd")
# ---- classes

# nodes ----
var HighlighterTip: PIIHighlighterTip : get = get_HighlighterTip
var GlyphW: PIIGlyphW : get = get_GlyphW
var GlyphX: PIIGlyphX : get = get_GlyphX
var GlyphA: PIIGlyphA : get = get_GlyphA
var GlyphT: PIIGlyphT : get = get_GlyphT
var Battery: PIIBattery : get = get_Battery
var Screw: PIIScrew : get = get_Screw
# ---- nodes

# functions ----
func get_HighlighterTip() -> PIIHighlighterTip: return get_item_instance("HighlighterTip")
func get_GlyphW() -> PIIGlyphW: return get_item_instance("GlyphW")
func get_GlyphX() -> PIIGlyphX: return get_item_instance("GlyphX")
func get_GlyphA() -> PIIGlyphA: return get_item_instance("GlyphA")
func get_GlyphT() -> PIIGlyphT: return get_item_instance("GlyphT")
func get_Battery() -> PIIBattery: return get_item_instance("Battery")
func get_Screw() -> PIIScrew: return get_item_instance("Screw")
# ---- functions

