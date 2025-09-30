extends Button

var last_click_time := 0.0
var double_click_max_delay := 0.3 # tempo máximo entre cliques (segundos)

func _ready():
	connect("pressed", Callable(self, "_on_button_pressed"))

func _on_button_pressed():
	var current_time = Time.get_ticks_msec() / 1000.0
	if current_time - last_click_time <= double_click_max_delay:
		_on_double_click()
	last_click_time = current_time

func _on_double_click():
	# aqui você pode exibir sua UI
	$"../HUD".visible = true
