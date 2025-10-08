extends Control

func _on_play_pressed() -> void:
	# Troca para outra cena (exemplo: "res://game.tscn")
	get_tree().change_scene_to_file("res://scenes/Main.tscn")

func _on_exit_pressed() -> void:
	# Sai do jogo
	get_tree().quit()
