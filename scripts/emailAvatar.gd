#extends Node2D  # ou Control, tanto faz
#
#@onready var http_request: HTTPRequest = $HTTPRequest
#@onready var avatar_texture: TextureRect = $Avatar
#
#var state := "fetch_json"  # controla se estamos pegando JSON ou imagem
#
#func _ready():
	## conecta o sinal de resposta
	#http_request.request_completed.connect(_on_request_completed)
	## inicia com o JSON
	#http_request.request("https://randomuser.me/api/")
#
#func _on_request_completed(result, response_code, headers, body):
	#if result != OK or response_code != 200:
		#print("Erro ao buscar:", result, response_code)
		#return
#
	#if state == "fetch_json":
		## Parse do JSON
		#var data = JSON.parse_string(body.get_string_from_utf8())
		#if typeof(data) == TYPE_DICTIONARY and data.has("results"):
			#var image_url = data["results"][0]["picture"]["large"]
			#print("Baixando imagem:", image_url)
#
			## muda o estado e faz nova request
			#state = "fetch_image"
			#http_request.request(image_url)
#
	#elif state == "fetch_image":
		## Carrega a imagem
		#var img = Image.new()
		#var err = img.load_jpg_from_buffer(body)
		#if err != OK:
			#err = img.load_png_from_buffer(body)  # fallback caso venha em PNG
		#if err == OK:
			#var tex = ImageTexture.create_from_image(img)
			#avatar_texture.texture = tex
			#print("Imagem carregada com sucesso!")
		#else:
			#print("Erro ao carregar imagem:", err)
#
		## reseta estado para poder buscar de novo no futuro
		#state = "fetch_json"
