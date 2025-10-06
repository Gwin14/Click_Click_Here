extends Control  # ou TextureRect

# Permite definir no editor se o nó começa visível
@export var start_visible: bool = true

func _ready():
	# Define a visibilidade inicial
	visible = start_visible
	
func _process(delta):
	if material:  # pega o material do próprio nó
		material.set_shader_parameter("time", Time.get_ticks_msec() / 1000.0)
