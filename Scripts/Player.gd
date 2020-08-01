extends "res://Scripts/Stickman.gd"

var inventory = {}
#3   inventory['Apple'] = [15, 8]

func _ready():
	self.hp = 30
	set_start_hp(self.hp, self.max_hp)
	add_to_group(GlobalVars.entity_group)

func pick(item):
	var it = item.get_item()
	if it in inventory.keys():
		inventory[it][0] += item.get_amount()
	else:
		inventory[it] = [item.get_amount(), item.get_item_stack()]
	ui.update_inventory(inventory)

func _process(delta):
	
	var velocity = Vector2()
	if Input.is_action_pressed("up"):
		velocity.y -= speed
	if Input.is_action_pressed("down"):
		velocity.y += speed
	if Input.is_action_pressed("left"):
		velocity.x -= speed
	if Input.is_action_pressed("right"):
		velocity.x += speed
	move_and_slide(velocity)
	
	position.x = clamp(position.x, 0, 10000)
	position.y = clamp(position.y, 0, 10000)
	$Position2D.position = get_global_mouse_position() - position
	$Position2D.position.x = clamp($Position2D.position.x, -24, 40)
	$Position2D.position.y = clamp($Position2D.position.y, -24, 40)

func die():
	get_parent().player_died(position)
	.die()

func _unhandled_input(event):
	if event.is_action_pressed("inventory"):
		ui.toggle_inventory(inventory)
	if event.is_action_pressed("left_click"):
		var a = load("res://Scenes/DamageArea.tscn").instance()
		get_parent().add_child(a)
		a.position = position + $Position2D.position
