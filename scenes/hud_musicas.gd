extends Panel

@export var play_icon: Texture2D
@export var pause_icon: Texture2D

@export var music1: AudioStream
@export var music2: AudioStream
@export var music3: AudioStream

var player: AudioStreamPlayer
var buttons := {} # dicionário: botão -> música
var current_button: TextureButton = null

func _ready():
	player = $AudioStreamPlayer
	
	# associa cada botão a uma música
	buttons[$MusicButton1] = music1
	buttons[$MusicButton2] = music2
	buttons[$MusicButton3] = music3

	# configura ícones iniciais
	for b in buttons.keys():
		b.texture_normal = play_icon
		b.pressed.connect(func(): _on_button_pressed(b))

func _on_button_pressed(button: TextureButton):
	var stream = buttons[button]
	
	# se clicou no mesmo botão que já está tocando → pausa
	if current_button == button and player.playing:
		player.stop()
		button.texture_normal = play_icon
		current_button = null
		return
	
	# para qualquer música tocando
	if player.playing:
		player.stop()
		if current_button:
			current_button.texture_normal = play_icon
	
	# toca a nova música
	player.stream = stream
	if stream is AudioStreamWAV:
		(stream as AudioStreamWAV).loop_mode = AudioStreamWAV.LOOP_FORWARD
	if stream is AudioStreamOggVorbis:
		(stream as AudioStreamOggVorbis).loop = true
	
	player.play()
	button.texture_normal = pause_icon
	current_button = button
