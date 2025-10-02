extends Button

@export var hud: Control

var last_click_time := 0.0
var double_click_max_delay := 0.3

var dragging := false
var drag_offset := Vector2.ZERO
var press_position := Vector2.ZERO
var move_threshold := 5.0 # pixels de tolerância para diferenciar clique x arraste

func _ready():
	connect("pressed", Callable(self, "_on_button_pressed"))

func _on_button_pressed():
	press_position = get_global_mouse_position()

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = false
			drag_offset = get_global_mouse_position() - global_position
		else:
			# Só conta como clique se o mouse não se moveu demais
			if get_global_mouse_position().distance_to(press_position) <= move_threshold:
				_check_double_click()
			dragging = false

	elif event is InputEventMouseMotion and event.button_mask & MOUSE_BUTTON_MASK_LEFT:
		if get_global_mouse_position().distance_to(press_position) > move_threshold:
			dragging = true
		if dragging:
			# Move apenas o botão
			global_position = get_global_mouse_position() - drag_offset

func _check_double_click():
	var current_time = Time.get_ticks_msec() / 1000.0
	if current_time - last_click_time <= double_click_max_delay:
		_on_double_click()
	last_click_time = current_time

func _on_double_click():
	if hud:
		hud.visible = true
