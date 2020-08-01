extends Area2D

var damaged = false

func _ready():
	$Timer.start()

func _process(delta):
	if not damaged and get_overlapping_bodies() != []:
		for i in get_overlapping_bodies():
			if i in get_tree().get_nodes_in_group(GlobalVars.animal_group):
				i.reduce_hp(10)
		damaged = true

func _on_Timer_timeout():
	get_parent().remove_child(self)
	queue_free()
	pass # Replace with function body.


func _on_DamageArea_area_entered(area):
	pass # Replace with function body.
