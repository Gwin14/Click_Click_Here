extends Panel

var dragging := false
var drag_offset := Vector2.ZERO
var area_size := Vector2(800, 600) # tamanho da área permitida (por ex. sua tela ou container)

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
			drag_offset = get_local_mouse_position()
		else:
			dragging = false

	elif event is InputEventMouseMotion and dragging:
		var new_pos = global_position + event.relative
		# limitar dentro da área
		new_pos.x = clamp(new_pos.x, 0, area_size.x - size.x)
		new_pos.y = clamp(new_pos.y, 0, area_size.y - size.y)
		global_position = new_pos
