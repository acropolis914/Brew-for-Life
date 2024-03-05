extends Control

var amplitude := 6.0
var frequency := 3.0
var time = 0

@onready var default_pos = $Logo.get_position()
@onready var Logo = $Logo
@export var main: PackedScene

func _ready():
	pass
	
func _process(delta : float):
	time += delta * frequency
	$Logo.set_position(default_pos + Vector2(0, sin(time) * amplitude))


func _on_button_pressed():
	EzTransitions.set_easing(0, 1)
	EzTransitions.set_trans(2, 2)
	EzTransitions.set_timers(1.1, 0, 1)
	EzTransitions.set_reverse(false, true)
	EzTransitions.set_textures("res://addons/ez_transitions/images/black_texture.png", "res://addons/ez_transitions/images/black_texture.png")
	EzTransitions.set_types(0, 0)
	EzTransitions.change_scene("Scripts/main.tscn")

