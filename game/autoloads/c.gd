@tool
extends "res://addons/popochiu/engine/interfaces/i_character.gd"

# classes ----
const PCTibs := preload("res://game/characters/tibs/character_tibs.gd")
const PCRat1 := preload("res://game/characters/rat_1/character_rat_1.gd")
const PCHand := preload("res://game/characters/hand/character_hand.gd")
const PCRat2 := preload("res://game/characters/rat_2/character_rat_2.gd")
const PCZippy := preload("res://game/characters/zippy/character_zippy.gd")
const PCLightbulb := preload("res://game/characters/lightbulb/character_lightbulb.gd")
const PCCultRat1 := preload("res://game/characters/cult_rat_1/character_cult_rat_1.gd")
const PCCultRat2 := preload("res://game/characters/cult_rat_2/character_cult_rat_2.gd")
const PCCultRat3 := preload("res://game/characters/cult_rat_3/character_cult_rat_3.gd")
const PCNibbles := preload("res://game/characters/nibbles/character_nibbles.gd")
const PCScraps := preload("res://game/characters/scraps/character_scraps.gd")
const PCWheel := preload("res://game/characters/wheel/character_wheel.gd")
# ---- classes

# nodes ----
var Tibs: PCTibs : get = get_Tibs
var Rat1: PCRat1 : get = get_Rat1
var Hand: PCHand : get = get_Hand
var Rat2: PCRat2 : get = get_Rat2
var Zippy: PCZippy : get = get_Zippy
var Lightbulb: PCLightbulb : get = get_Lightbulb
var CultRat1: PCCultRat1 : get = get_CultRat1
var CultRat2: PCCultRat2 : get = get_CultRat2
var CultRat3: PCCultRat3 : get = get_CultRat3
var Nibbles: PCNibbles : get = get_Nibbles
var Scraps: PCScraps : get = get_Scraps
var Wheel: PCWheel : get = get_Wheel
# ---- nodes

# functions ----
func get_Tibs() -> PCTibs: return get_runtime_character("Tibs")
func get_Rat1() -> PCRat1: return get_runtime_character("Rat1")
func get_Hand() -> PCHand: return get_runtime_character("Hand")
func get_Rat2() -> PCRat2: return get_runtime_character("Rat2")
func get_Zippy() -> PCZippy: return get_runtime_character("Zippy")
func get_Lightbulb() -> PCLightbulb: return get_runtime_character("Lightbulb")
func get_CultRat1() -> PCCultRat1: return get_runtime_character("CultRat1")
func get_CultRat2() -> PCCultRat2: return get_runtime_character("CultRat2")
func get_CultRat3() -> PCCultRat3: return get_runtime_character("CultRat3")
func get_Nibbles() -> PCNibbles: return get_runtime_character("Nibbles")
func get_Scraps() -> PCScraps: return get_runtime_character("Scraps")
func get_Wheel() -> PCWheel: return get_runtime_character("Wheel")
# ---- functions
