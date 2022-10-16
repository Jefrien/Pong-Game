extends Node2D

onready var global = get_node("/root/Global")

func _ready():
	$Scores.text = str(global.scorep1) + " - " + str(global.scorep2)
	if global.scorep1 > global.scorep2:
		$Winner.text = "Winner Player 1"
	else:
		$Winner.text = "Winner Player 2"

func _on_Button_pressed():
	get_tree().change_scene("res://Menu.tscn")
