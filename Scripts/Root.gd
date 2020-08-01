extends Node2D

func update_label(value):
	get_node("UI/Control/Counter").text = "Items: %s" % str(value)

func game_over():
	$UI.game_over()

func _ready():
	pass 
