extends Control  # ou TextureRect

func _process(delta):
	if material:  # pega o material do próprio nó
		material.set_shader_parameter("time", Time.get_ticks_msec() / 1000.0)
