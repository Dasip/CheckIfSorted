extends Node2D

onready var item = preload("res://Scenes/Item.tscn")

func get_player():
	if has_node("Player"):
		return $Player
	return false

func player_died(pos):
	$DeathCam.current = true
	$DeathCam.position = pos
	get_parent().game_over()

func update_label(value):
	get_parent().update_label(value)

func _ready():
	var items = [["apple", 8], ["prut", 8], ["pebble", 8], ["branch", 4]]
	for i in range(100):
		randomize()
		var a = int(rand_range(0, 4))
		var new_item = item.instance()
		$Items.add_child(new_item)
		new_item.set_item(items[a])
		new_item.position = Vector2(int(rand_range(0, 32*58)), int(rand_range(0, 32*41)))
	pass 

func _unhandled_input(event):
	if event.is_action_pressed("Alt"):
		for i in get_tree().get_nodes_in_group(GlobalVars.entity_group):
			i.toggle_hp_bar()
