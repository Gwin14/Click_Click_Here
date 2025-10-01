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
@onready var barra = $HUD_email/Seguranca
@onready var feedback = $HUD_email/Feedback
@onready var lbl_manual = $HUD_tasks/lbl_manual  # 🔹 novo Label para exibir informações

func _ready():
	carregar_solicitacoes()
	mostrar_solicitacao()
	mostrar_manual()   # mostra as infos desde o início

func carregar_solicitacoes():
	solicitacoes = [
		{
			"tipo": "email",
			"remetente": "suporte@amaz0n-security.com",
			"texto": "De: suporte@amaz0n-security.com\nAssunto: URGENTE! Confirme seus dados...",
			"feedback_ok": "✅ CORRETO! Esse e-mail era phishing!",
			"feedback_err": "❌ ERRO! Você aprovou um e-mail fraudulento!\n📌 Dica: O domínio oficial é @empresa.com.br"
		},
		{
			"tipo": "email",
			"remetente": "suporte@empresa.com.br",
			"texto": "De: suporte@empresa.com.br\nAssunto: Aviso de manutenção.\nPrezado colaborador...",
			"feedback_ok": "✅ CORRETO! Este é um e-mail legítimo.",
			"feedback_err": "❌ ERRO! Você negou um e-mail verdadeiro.\n📌 Dica: Compare com a lista de e-mails válidos no manual."
		},
		{
			"tipo": "funcionario",
			"nome": "Carlos Souza",
			"texto": "Pedido: Funcionário Carlos Souza solicita acesso ao sistema financeiro.",
			"feedback_ok": "✅ CORRETO! Esse funcionário não existe na base, acesso negado.",
			"feedback_err": "❌ ERRO! Você aprovou acesso de um funcionário inexistente!\n📌 Dica: Consulte a lista de funcionários autorizados."
		},
		{
			"tipo": "funcionario",
			"nome": "Maria Souza",
			"texto": "Pedido: Funcionária Maria Souza solicita reset de senha.",
			"feedback_ok": "✅ CORRETO! Funcionária válida, pedido aceito.",
			"feedback_err": "❌ ERRO! Você negou o pedido de uma funcionária legítima.\n📌 Dica: Verifique nomes autorizados no manual."
		}
	]

func mostrar_solicitacao():
	if indice_atual < solicitacoes.size():
		lbl_texto.text = solicitacoes[indice_atual]["texto"]
		feedback.text = ""
	else:
		game_over()

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
			game_over()
			return

	indice_atual += 1
	await get_tree().create_timer(2.0).timeout
	mostrar_solicitacao()

# 🔹 Exibir informações oficiais no Label
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

# 🔹 Função que valida a solicitação contra as regras da empresa
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

func game_over():
	lbl_texto.text = "🚨 FIM DE JOGO!"
	feedback.text = "Obrigado por jogar Cyber Guard!"
