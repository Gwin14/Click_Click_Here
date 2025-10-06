# Click! Click Here!

**Premissa:** Você é o analista de segurança de uma empresa e precisa aprovar ou negar solicitações diárias (e-mails, pedidos de acesso, dispositivos externos) identificando ameaças.

### Estrutura de Jogo

**Mecânica Principal:**

- Cada "dia" traz 5-10 solicitações
- Jogador analisa evidências e decide: ✅ APROVAR ou ❌ NEGAR
- Sistema de pontuação: acertos aumentam score, erros comprometem a "segurança da empresa"
- Se cometer muitos erros, é "demitido" (game over)

### 5 Ameaças a Abordar:

1. **📧 Phishing por E-mail**
	- E-mails com links suspeitos, remetentes falsos, urgência artificial
	- Pistas: domínio errado (@amaz0n.com), erros de português, pedidos urgentes de senha
2. **🔑 Senhas Fracas**
	- Funcionários solicitando resetar senha para algo simples
	- Pistas: senha = "123456", "senha123", sem caracteres especiais
3. **💾 Dispositivos Externos Suspeitos**
	- Pedidos para conectar pendrives, HDs externos desconhecidos
	- Pistas: dispositivo encontrado no estacionamento, sem identificação, origem duvidosa
4. **🌐 Acesso a Sites Suspeitos**
	- Solicitações para liberar sites no firewall
	- Pistas: URLs encurtadas, sites sem HTTPS, domínios estranhos
5. **📤 Compartilhamento Indevido**
	- Pedidos para enviar dados confidenciais por canais inseguros
	- Pistas: envio de senhas por WhatsApp, documentos para e-mails pessoais

### Elementos do Jogo (estilo Papers Please):

**Na Mesa do Jogador:**

- 📋 **Manual de Segurança** (pode consultar regras)
- 📧 **Solicitação atual** (e-mail, ticket, pedido)
- 🔍 **Lupa** (para examinar detalhes: header do e-mail, URL completa)
- ⚖️ **Carimbos:** APROVADO / NEGADO
- 📊 **Medidor de segurança** (cai a cada erro)

**Exemplos de Solicitações:**

```
═══════════════════════════════
📧 E-MAIL RECEBIDO
───────────────────────────────
De: suporte@amaz0n-security.com
Para: voce@empresa.com.br
Assunto: URGENTE! Confirme seus dados

Prezado cliente,

Detectamos atividade suspeita em sua
conta. Clique AQUI para verificar:
http://bit.ly/xyz123

Sua conta será bloqueada em 24h!

Atenciosamente,
Equipe Amazon
═══════════════════════════════

```

### Feedback Educativo:

**Ao NEGAR corretamente:**

> ✅ CORRETO! Esse e-mail era phishing!
> 
> 
> 🎓 **Dica:** Amazon nunca usa domínios alternativos. O correto seria @amazon.com.br
> 

**Ao APROVAR incorretamente:**

> ❌ ERRO! Você aprovou um e-mail fraudulento!
> 
> 
> ⚠️ **Segurança comprometida em 15%**
> 
> 🎓 **Lembre-se:** Sempre verifique o domínio completo do remetente.
>
