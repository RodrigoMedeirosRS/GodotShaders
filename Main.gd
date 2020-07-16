extends Node2D

onready var Tesselator = preload("res://Tesselator.tscn")
onready var Environment = preload("res://EnvironmentMapping.tscn")
onready var Geometry = preload("res://Geometry.tscn")
onready var Cel = preload("res://CelShading.tscn")

func _on_Button_button_down():
	var NewCena = Tesselator.instance()
	add_child(NewCena)
	get_child(0).hide()

func _on_Button2_button_down():
	var NewCena = Environment.instance()
	add_child(NewCena)
	get_child(0).hide()

func _on_Button3_button_down():
	var NewCena = Geometry.instance()
	add_child(NewCena)
	get_child(0).hide()

func _on_Button4_button_down():
	var NewCena = Cel.instance()
	add_child(NewCena)
	get_child(0).hide()
