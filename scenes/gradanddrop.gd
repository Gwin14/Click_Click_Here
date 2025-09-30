extends Control  # esse script fica no TitleBar

var dragging := false
var drag_offset := Vector2.ZERO
var area_size := Vector2.ZERO

func _ready():
	area_size = get_viewport_rect().size

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
			# pega a distância do clique até o canto do pai
			drag_offset = get_local_mouse_position()
		else:
			dragging = false

	elif event is InputEventMouseMotion and dragging:
		var parent_panel = get_parent()  # pega o elemento pai
		var new_pos = get_global_mouse_position() - drag_offset
		# limita dentro da tela
		new_pos.x = clamp(new_pos.x, 0, area_size.x - parent_panel.size.x)
		new_pos.y = clamp(new_pos.y, 0, area_size.y - parent_panel.size.y)
		parent_panel.global_position = new_pos
