extends Control

var solicitacoes = []
var indice_atual = 0
var seguranca = 100

# 🔹 Base de informações da empresa
var empresa_info = {
	"dominio": "empresa.com.br",
	"emails_validos": ["suporte@empresa.com.br", "ti@empresa.com.br"],
	"funcionarios": ["João Silva", "Maria Souza", "Ana Pereira"]
}

@onready var lbl_texto = $HUD_email/Label
@onready var avatar = $HUD_email/Avatar
@onready var barra = $HUD_email/Seguranca
@onready var feedback = $HUD_email/Feedback
@onready var lbl_manual = $HUD_tasks/lbl_manual
@onready var http_request: HTTPRequest = $HTTPRequest
@onready var game_over_ui: CanvasLayer = $GameOverUI

var state := "idle"

func _ready():
	http_request.request_completed.connect(_on_request_completed)
	carregar_solicitacoes()
	mostrar_solicitacao()
	mostrar_manual()

func carregar_solicitacoes():
	var dados = load("res://scripts/solicitacoes.gd")
	solicitacoes = dados.LISTA.duplicate()
	solicitacoes.shuffle()

func mostrar_solicitacao():
	if indice_atual < solicitacoes.size():
		var atual = solicitacoes[indice_atual]
		lbl_texto.text = atual["texto"]
		feedback.text = ""

		# 🔹 toda vez que mostrar solicitação → buscar nova imagem
		state = "fetch_json"
		http_request.request("https://randomuser.me/api/")
	else:
		game_over(true)

func aprovar():
	verificar("aprovar")

func negar():
	verificar("negar")

func verificar(escolha):
	var atual = solicitacoes[indice_atual]
	var esperado = validar(atual)

	if escolha == esperado:
		feedback.text = atual["feedback_ok"]
	else:
		feedback.text = atual["feedback_err"]
		seguranca -= 15
		barra.value = seguranca
		if seguranca <= 0:
			game_over(false)
			return

	indice_atual += 1
	await get_tree().create_timer(2.0).timeout
	mostrar_solicitacao()

func mostrar_manual():
	var texto = "📘 Manual da Empresa\n"
	texto += "Domínio oficial: " + empresa_info["dominio"] + "\n\n"
	texto += "E-mails válidos:\n"
	for e in empresa_info["emails_validos"]:
		texto += " - " + e + "\n"
	texto += "\nFuncionários autorizados:\n"
	for f in empresa_info["funcionarios"]:
		texto += " - " + f + "\n"
	lbl_manual.text = texto

func validar(req):
	match req["tipo"]:
		"email":
			var remetente = req["remetente"]
			if remetente in empresa_info["emails_validos"]:
				return "aprovar"
			else:
				return "negar"

		"funcionario":
			var nome = req["nome"]
			if nome in empresa_info["funcionarios"]:
				return "aprovar"
			else:
				return "negar"

		_:
			return "negar"


func game_over(venceu: bool = false):
	var titulo := "🏁 Você venceu!" if venceu else "🚨 FIM DE JOGO!"

	var stats := get_endgame_stats(seguranca)
	var texto := "Segurança final: %d%%\n" % seguranca
	texto += "\nImpactos:\n"
	for s in stats:
		texto += " - " + s + "\n"
	texto += "\nObrigado por jogar Cyber Guard!"

	# Mostrar tudo no mesmo campo do título (onde aparece "Você venceu!")
	lbl_texto.text = titulo + "\n\n" + texto
	feedback.text = ""

	if !venceu:
		game_over_ui.visible = true
		
		if has_node("SomGameOver"):
			$SomGameOver.play()
		
		# 🔹 Esperar 6 segundos e fechar o jogo
		await get_tree().create_timer(6.0).timeout
		get_tree().quit()

	
	# 🔹 Esperar 6 segundos e fechar o jogo
	await get_tree().create_timer(6.0).timeout
	get_tree().quit()


# 🔹 callback do HTTPRequest
func _on_request_completed(result, response_code, headers, body):
	if result != OK or response_code != 200:
		print("Erro na requisição:", result, response_code)
		return

	if state == "fetch_json":
		var data = JSON.parse_string(body.get_string_from_utf8())
		if typeof(data) == TYPE_DICTIONARY and data.has("results"):
			var img_url = data["results"][0]["picture"]["large"]
			state = "fetch_image"
			http_request.request(img_url)

	elif state == "fetch_image":
		var img = Image.new()
		var err = img.load_jpg_from_buffer(body)
		if err != OK:
			err = img.load_png_from_buffer(body)
		if err == OK:
			var tex = ImageTexture.create_from_image(img)
			avatar.texture = tex
		else:
			print("Erro ao carregar imagem:", err)
		state = "idle"


func _on_btn_negar_pressed() -> void:
	negar()
	

func _on_btn_aprovar_pressed() -> void:
	aprovar()


# 🔹 Gera estatísticas de impacto com base na porcentagem final de segurança
func get_endgame_stats(porc: int) -> Array:
	# Ordenado do maior estrago para o menor
	var critico := [
		"Banco de dados comprometido",
		"Ransomware em servidores críticos",
		"Exfiltração de dados sigilosos"
	]
	var alto := [
		"Senhas vazadas",
		"Conta administrativa comprometida",
		"Credenciais expostas em phishing"
	]
	var medio := [
		"Vazamento de e-mails internos",
		"Tentativas de intrusão detectadas",
		"Exposição de metadados públicos"
	]
	var baixo := [
		"Tentativas bloqueadas pelo firewall",
		"Phishing identificado e reportado",
		"Boas práticas aplicadas"
	]

	if porc <= 10:
		return critico + alto + medio
	elif porc <= 30:
		return alto + critico + medio
	elif porc <= 50:
		return alto + medio
	elif porc <= 70:
		return medio + alto
	elif porc <= 90:
		return medio + baixo
	else:
		return baixo
