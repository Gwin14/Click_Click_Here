# Arquivo: solicitacoes.gd
# Contém apenas a lista de solicitações
# VERSÃO GIGANTESCA E MÁXIMO DETALHAMENTO EM CADA CORPO DE E-MAIL

const LISTA = [
	# --- BASE ORIGINAL E REGRAS CLARAS (Refatoradas para E-mail Longo) ---
	{
		"tipo": "email",
		"remetente": "suporte@amaz0n-security.com", # Falso domínio
		"texto": "De: suporte@amaz0n-security.com\nAssunto: [ALERTA DE SEGURANÇA CRÍTICO] Falha na Verificação de Dois Fatores (2FA)\n\nPrezado cliente,\n\nNossos sistemas detectaram uma falha crítica na sua autenticação de dois fatores, colocando sua conta em risco iminente. Para restaurar a segurança total e evitar a suspensão permanente dos seus serviços, que inclui o acesso a todos os arquivos de trabalho e e-mails, solicitamos que **confirme seus dados completos** imediatamente através do link seguro abaixo.\n\nESTE É UM PROCESSO OBRIGATÓRIO E TEMPORIZADO. Sua conta será suspensa em 2 horas se não houver resposta. Trate isso como URGENTE.\n\nAtenciosamente,\nEquipe de Suporte e Segurança Amaz0n-Security",
		"feedback_ok": "✅ CORRETO! Phishing! O domínio falso (@amaz0n-security.com) e a extrema urgência são sinais de ataque.",
		"feedback_err": "❌ ERRO! Você aprovou um e-mail fraudulento!\n📌 Dica: O domínio oficial é @empresa.com.br. Nunca clique em links de domínios externos que pedem confirmação de dados críticos."
	},
	{
		"tipo": "email",
		"remetente": "suporte@empresa.com.br", # Válido
		"texto": "De: suporte@empresa.com.br\nAssunto: Manutenção Agendada para o Servidor de Arquivos Internos\n\nPrezado(a) Colaborador(a),\n\nInformamos que está agendada uma manutenção essencial para otimizar o desempenho do Servidor de Arquivos (Sistema EFS-03). O processo ocorrerá na madrugada de sábado, das 00:00h às 05:00h. Durante este período, o acesso aos arquivos compartilhados pode ser intermitente.\n\nNão haverá qualquer impacto nas operações diurnas normais. Pedimos a gentileza de salvar todos os documentos abertos antes do final do expediente de sexta-feira.\n\nEm caso de dúvidas, por favor, responda a este e-mail. Agradecemos a compreensão.\n\nAtenciosamente,\nEquipe de Suporte Técnico",
		"feedback_ok": "✅ CORRETO! Este é um e-mail legítimo de um remetente válido, fornecendo informações de rotina.",
		"feedback_err": "❌ ERRO! Você negou um e-mail verdadeiro. Manutenções são comuns e o remetente (@empresa.com.br) é legítimo."
	},
	{
		"tipo": "email",
		"remetente": "carlos.souza@empresa.com.br", # Func. Inválido - Phishing interno
		"texto": "De: carlos.souza@empresa.com.br\nAssunto: [MUITO URGENTE] Solicitação de Acesso ao Sistema Financeiro para Pagamento de Fornecedor Chave\n\nPrezado(a) TI,\n\nSou **Carlos Souza**, o novo Analista Júnior do setor de Contabilidade. Estou encarregado de processar um pagamento urgente para um fornecedor chave antes do fechamento do dia, mas não tenho acesso ao módulo de Transações do Sistema Financeiro (FIN-10). O Diretor já me deu luz verde.\n\nPor favor, peço que me concedam permissão de acesso total o mais rápido possível (nível de acesso 'Analista Pleno'). O não processamento deste pagamento pode gerar multas pesadas. Liguem-me se necessário.\n\nObrigado pela agilidade,\nCarlos Souza\nContabilidade",
		"feedback_ok": "✅ CORRETO! O funcionário **Carlos Souza** não existe na base. Além disso, pedidos URGENTES de acesso a sistemas críticos por e-mail pessoal são suspeitos. Acesso negado.",
		"feedback_err": "❌ ERRO! Você aprovou acesso a um sistema sensível a um funcionário **inexistente** (Eng. Social).\n📌 Dica: A urgência é uma tática. Sempre verifique o nome do funcionário na base."
	},
	{
		"tipo": "email",
		"remetente": "maria.souza@empresa.com.br", # Func. Válida
		"texto": "De: maria.souza@empresa.com.br\nAssunto: Impossibilidade de Login - Solicitacao de Reset de Senha\n\nPrezado Suporte,\n\nMinha senha de acesso à rede corporativa expirou há algumas horas, conforme a política de segurança trimestral. Tentei seguir o procedimento de redefinição automática, mas o e-mail de recuperação não chegou.\n\nPoderiam, por favor, fazer o reset manual da minha senha? Eu irei redefini-la imediatamente após a liberação.\n\nObrigada pela ajuda,\nMaria Souza\nAnalista de RH",
		"feedback_ok": "✅ CORRETO! A funcionária **Maria Souza** é válida. É um pedido de rotina e seguro.",
		"feedback_err": "❌ ERRO! Você negou o pedido de uma funcionária legítima.\n📌 Dica: Verifique nomes autorizados no manual. Este é um pedido normal de suporte."
	},
	
	# --- VARIAÇÕES DE PHISHING (E-MAIL LONGO) ---

	{
		"tipo": "email",
		"remetente": "rh@empressa.com.br", # Typosquatting (domínio errado: 'empressa')
		"texto": "De: rh@empressa.com.br\nAssunto: Ação Necessária: Recadastramento Urgente de Benefícios 2024\n\nPrezado Colaborador(a),\n\nDevido a uma migração obrigatória de nosso sistema de gestão de recursos humanos (RH), é mandatório que todos os colaboradores atualizem seus dados cadastrais e de benefícios, incluindo informações bancárias para o depósito do próximo salário.\n\nO prazo final é de 48 horas. Se o recadastramento não for concluído, seu acesso ao portal de RH será bloqueado, e o pagamento de seu salário poderá ser retido até a regularização.\n\nClique no link abaixo para ser redirecionado ao **Novo Portal de Recadastramento**.\n\nPedimos desculpas pelo inconveniente.\n\nDepartamento de Recursos Humanos (empressa.com.br)",
		"feedback_ok": "✅ CORRETO! Phishing! O domínio está soletrado incorretamente ('empressa'). A urgência e a menção a dados bancários/salário são táticas de ataque.",
		"feedback_err": "❌ ERRO! Você aprovou um e-mail fraudulento. Verifique sempre o domínio: **'empressa' vs 'empresa'**."
	},
	{
		"tipo": "email",
		"remetente": "financeiro@empresa.com.br", # Domínio correto, remetente NÃO listado (Protocolo)
		"texto": "De: financeiro@empresa.com.br\nAssunto: NOTA FISCAL ANEXA - Pagamento de Serviço Essencial Vencido\n\nOlá Suporte,\n\nEstamos com um problema sério: A Nota Fiscal N.º 54897, referente à licença de um software essencial para a área de TI, venceu hoje e precisamos do pagamento imediato para evitar a interrupção do serviço. Enviamos o boleto em anexo.\n\nPor se tratar de um serviço de TI, solicitamos que o setor de Suporte ou TI dê a baixa e encaminhe o comprovante de pagamento à Contabilidade. Pedido de máxima prioridade, por favor.\n\nAtt,\nEquipe Financeira.",
		"feedback_ok": "✅ CORRETO! Remetente não está na lista de e-mails VÁLIDOS (**suporte/ti**). Pedidos de pagamento devem ser confirmados via outros canais. Negado por protocolo.",
		"feedback_err": "❌ ERRO! Apenas remetentes expressamente listados (**suporte/ti**) devem ser aprovados. Este pode ser um ataque de Comprometimento de E-mail Comercial (BEC)."
	},
	
	# --- ENGENHARIA SOCIAL VIA E-MAIL (Funcionários Longos) ---

	{
		"tipo": "email",
		"remetente": "joao.silva@empresa.com.br", # Func. Válido
		"texto": "De: joao.silva@empresa.com.br\nAssunto: Acesso de leitura à pasta de documentos jurídicos - Solicitação de Projeto\n\nPrezado TI,\n\nSou **João Silva**, Analista de Projetos Sênior. Estou coordenando o novo projeto de compliance (Projeto Alpha-05) e preciso urgentemente de acesso de *leitura* à pasta 'Documentos Jurídicos/Regulamentos' para mapear as necessidades do sistema.\n\nO acesso deve ser temporário (30 dias) e somente leitura, conforme o escopo do projeto já aprovado pelo Gerente da Área. Por favor, implementem a permissão e me avisem assim que estiver pronto.\n\nObrigado,\nJoão Silva",
		"feedback_ok": "✅ CORRETO! Funcionário **João Silva** válido. O pedido tem justificativa clara e pede o mínimo de permissão (apenas leitura).",
		"feedback_err": "❌ ERRO! Você negou o pedido de um funcionário legítimo. O pedido é coerente com a função."
	},
	{
		"tipo": "email",
		"remetente": "ana.perreira@empresa.com.br", # Func. Inválida (Typosquatting: 'Perreira')
		"texto": "De: ana.perreira@empresa.com.br\nAssunto: Liberação de Porta e Firewall - Novo Software (URGENTE)\n\nEquipe de Segurança,\n\nAqui é a **Ana Perreira** do setor de Marketing. Acabamos de instalar um novo software de análise de mercado que exige a liberação imediata da Porta 8080 no Firewall para poder sincronizar os dados externos.\n\nEste software é vital para o lançamento da campanha na próxima semana, e estou parada sem ele. Por favor, *liberem o acesso sem restrições* o mais rápido possível e enviem a confirmação para que eu possa prosseguir.\n\nAna Perreira\nAnalista de Marketing.",
		"feedback_ok": "✅ CORRETO! O funcionário **Ana Perreira** possui um 'r' a mais e não está na base. Além disso, pedidos de liberação 'sem restrições' são um mau sinal. Negar.",
		"feedback_err": "❌ ERRO! Você aprovou acesso crítico a um nome com erro de digitação! O nome correto é **Ana Pereira**."
	},
	{
		"tipo": "email",
		"remetente": "pedro.oliveira@empresa.com.br", # Func. Inválido
		"texto": "De: pedro.oliveira@empresa.com.br\nAssunto: Cópia de Segurança de Informações Confidenciais para Auditoria Externa\n\nPrezado TI,\n\nEm nome da diretoria, estou realizando uma auditoria externa urgente. Preciso de uma cópia completa de todos os dados confidenciais contidos no servidor 'SV-CONFI' para análise fora da rede. É necessário que o arquivo seja criptografado e colocado em uma pasta compartilhada para meu download.\n\nSou o **Pedro Oliveira**, e este pedido é de altíssima prioridade, supervisionado pelo VP de Operações. Por favor, realizem o procedimento em no máximo 1 hora.\n\nObrigado pela confidencialidade,\nPedro Oliveira\nAuditor Externo.",
		"feedback_ok": "✅ CORRETO! O funcionário **Pedro Oliveira** não existe na base. O pedido é extremamente suspeito (cópia de *todos* os dados confidenciais para *download*). Acesso negado.",
		"feedback_err": "❌ ERRO! Você aprovou o acesso a dados críticos de um funcionário **INEXISTENTE**! Este é um ataque de Roubo de Informação."
	},
	
	# --- VARIAÇÕES MISTAS PARA CONFUSÃO (E-MAIL LONGO) ---

	{
		"tipo": "email",
		"remetente": "ti@empresa.com.br", # Válido
		"texto": "De: ti@empresa.com.br\nAssunto: Confirmação de Obrigatoriedade de 2FA - Prazo Final: Amanhã\n\nPrezado(a) Colaborador(a),\n\nConforme o comunicado de 30 dias atrás, todos os usuários devem ativar o segundo fator de autenticação (2FA) em suas contas até o final do dia de amanhã. Este é um requisito de segurança da Diretoria.\n\nSe você ainda não ativou, pedimos que siga o procedimento detalhado no manual (Link interno seguro). Note que as contas sem 2FA serão temporariamente bloqueadas a partir da próxima semana.\n\nQualquer dificuldade, responda a este e-mail.\n\nAtenciosamente,\nEquipe de TI - Sistemas de Segurança",
		"feedback_ok": "✅ CORRETO! E-mail legítimo do TI, reforçando uma política conhecida, com tom informativo (não pedindo login imediato).",
		"feedback_err": "❌ ERRO! Você negou uma comunicação importante e legítima do TI."
	},
	{
		"tipo": "email",
		"remetente": "suporte@empresa.com", # Domínio Incorreto (Faltando .br)
		"texto": "De: suporte@empresa.com\nAssunto: Revisão de Salário e Alteração de Benefícios 2025\n\nPrezado(a),\n\nCom a conclusão do ciclo de avaliação de desempenho, a folha de pagamento para 2025 será ajustada. Para que você possa analisar sua nova tabela salarial e os benefícios atualizados, é **necessário** que responda a este e-mail fornecendo sua **matrícula e senha da rede**.\n\nEsta é a única forma de garantir que apenas você tenha acesso a informações tão confidenciais. Sua senha será usada para descriptografar os dados.\n\nPrazo: Fim do dia. Não perca a chance de revisar seu salário.\n\nSuporte ao Colaborador (empresa.com)",
		"feedback_ok": "✅ CORRETO! Phishing! O domínio está incorreto (faltando '.br'). O pedido de SENHA, mesmo sob pretexto de 'descriptografia', é a maior bandeira vermelha.",
		"feedback_err": "❌ ERRO! Você aprovou um phishing! Nunca se deve pedir senha por e-mail, e o domínio está errado (**empresa.com**)."
	},
	{
		"tipo": "email",
		"remetente": "maria.souza@empresa.com.br", # Func. Válida
		"texto": "De: maria.souza@empresa.com.br\nAssunto: Necessidade de Registro de Novo Número de Contato de Emergência\n\nPrezado RH/TI,\n\nSolicito o registro de meu novo número de telefone celular (**+55 (11) 98765-4321**) na base de dados, para fins de contato de emergência e validação de token.\n\nO número antigo não está mais ativo e isso pode comprometer o meu acesso. Agradeço a alteração.\n\nAtenciosamente,\nMaria Souza\nAnalista de RH",
		"feedback_ok": "✅ CORRETO! Funcionária **Maria Souza** válida. Pedido de rotina e necessário para segurança (token).",
		"feedback_err": "❌ ERRO! Você negou o pedido de uma funcionária legítima. O pedido é válido para atualização de dados de segurança."
	},
	{
		"tipo": "email",
		"remetente": "joao.silveira@empresa.com.br", # Func. Inválido (Typosquatting: 'Silveira')
		"texto": "De: joao.silveira@empresa.com.br\nAssunto: URGENTE - Liberação de Sistema e Troca de Equipamento\n\nEquipe,\n\nMinha estação de trabalho travou completamente devido a um erro de Kernel e estou parado, incapaz de acessar meus arquivos ou a rede. Sou o **Joao Silveira** (Logística).\n\nPreciso que um novo equipamento seja liberado imediatamente. Minha senha é 'Logistica123'. Usem-na para configurar e me avisem.\n\nGrato pela pressa,\nJoao Silveira",
		"feedback_ok": "✅ CORRETO! Funcionário **Joao Silveira** é diferente de **João Silva** e não está na base. Além disso, fornecer a senha e o pedido de *extrema* urgência são suspeitos. Negar.",
		"feedback_err": "❌ ERRO! Você aprovou um pedido baseado em um nome parecido e aceitou a senha do usuário por e-mail. Nunca aceite senhas e verifique o nome."
	},
	
	# Adicionar mais entradas longas para garantir o "gigantesco"
	
	{
		"tipo": "email",
		"remetente": "ti@empresa.com.br", # Válido
		"texto": "De: ti@empresa.com.br\nAssunto: Novo Sistema de Gerenciamento de Ativos (GA-2026) - Primeiras Instruções\n\nPrezado(a) Colaborador(a),\n\nConforme o planejamento estratégico, o TI está iniciando a migração para o novo Sistema GA-2026. Esta semana, a equipe de TI estará realizando as primeiras implementações de teste. Pedimos que, se for solicitado a executar um pequeno script ou teste de conectividade *pela Equipe de TI*, por favor, colabore. Todos os procedimentos de teste serão comunicados por este canal oficial.\n\nNão haverá necessidade de clicar em links externos.\n\nAtenciosamente,\nGerência de Projetos de TI.",
		"feedback_ok": "✅ CORRETO! E-mail legítimo do TI, informando sobre um projeto interno e alertando sobre como o procedimento de teste será feito (sem links externos).",
		"feedback_err": "❌ ERRO! Você negou um e-mail de comunicação interna legítima do TI."
	},
	{
		"tipo": "email",
		"remetente": "suporte@amaz0n-security.com", # Falso domínio (Repetição camuflada)
		"texto": "De: suporte@amaz0n-security.com\nAssunto: [Urgente] Reativação de Certificado Digital e-CNPJ expirado\n\nPrezado Administrador,\n\nSeu certificado digital e-CNPJ expirou e não foi renovado, o que impedirá a emissão de notas fiscais e a comunicação com a Receita Federal. O prazo de carência está se esgotando.\n\nPara reativar e renovar seu certificado, é necessário clicar no link de acesso ao painel de controle e inserir as credenciais da conta matriz. Não se preocupe, o processo é rápido e seguro.\n\nQualquer atraso resultará em bloqueio fiscal.\n\nSuporte Digital (amaz0n-security.com)",
		"feedback_ok": "✅ CORRETO! Phishing! Domínio incorreto ('amaz0n-security'). A tática é usar termos técnicos (e-CNPJ) e ameaças fiscais para criar pressão.",
		"feedback_err": "❌ ERRO! Você aprovou um e-mail fraudulento! Domínio inválido, mesmo com termos técnicos."
	},
]
