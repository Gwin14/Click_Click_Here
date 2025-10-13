![Logo](./Assets/gameIcon.png)

# 🎮 Click! Click Here!

![Godot Engine](https://img.shields.io/badge/Godot-4.5-blue?logo=godot-engine)
![License](https://img.shields.io/badge/license-MIT-green)
![Status](https://img.shields.io/badge/status-em%20andamento-yellow)

Um jogo educativo de segurança cibernética onde você assume o papel de um analista de TI responsável por identificar e bloquear ataques de phishing e engenharia social em uma empresa.

## 🎯 Sobre o Projeto

**Click! Click Here!** é um jogo desenvolvido em Godot 4.5 que simula um ambiente corporativo onde o jogador precisa analisar e-mails e solicitações de acesso, decidindo se deve aprovar ou negar cada pedido. O objetivo é ensinar, de forma prática e divertida, como identificar ataques cibernéticos comuns no mundo real.

### Objetivos Educacionais

- Ensinar a identificar e-mails de phishing
- Reconhecer técnicas de engenharia social
- Verificar autenticidade de domínios e remetentes
- Compreender a importância de políticas de segurança
- Desenvolver pensamento crítico em relação a solicitações suspeitas

## ✨ Características

- 🎨 **Interface nostálgica** estilo Windows XP
- 📧 **Sistema de e-mails realistas** com variações de phishing
- 👤 **Avatares dinâmicos** gerados via API (Random User)
- 🎵 **Player de música integrado** com 3 faixas
- 📊 **Barra de segurança** que diminui a cada erro
- 📖 **Manual da empresa** com regras e funcionários autorizados
- 🖱️ **Arrastar e soltar** para organizar janelas
- 🔄 **Solicitações aleatórias** para maior rejogabilidade

## 🎮 Como Jogar

### Objetivo

Mantenha a segurança da empresa acima de 0% analisando corretamente cada solicitação que chega. Cada erro diminui 15% da barra de segurança!

### Regras Básicas

1. **Verifique o domínio**: E-mails válidos devem vir de `@empresa.com.br`
2. **Confirme os remetentes**: Apenas `suporte@empresa.com.br` e `ti@empresa.com.br` são autorizados
3. **Valide funcionários**: Consulte o manual para verificar se o nome existe
4. **Desconfie de urgência**: Phishers usam pressão temporal
5. **Nunca aceite senhas**: Ninguém legítimo pede senhas por e-mail

### Tipos de Ameaças

- **Typosquatting**: Domínios com erros de digitação (`empressa.com.br`)
- **Domínios falsos**: Remetentes externos se passando pela empresa
- **Funcionários inexistentes**: Nomes que não constam no manual
- **Nomes similares**: Pequenas variações (`João Silva` vs `Joao Silveira`)
- **Pedidos suspeitos**: Solicitações de dados confidenciais ou senhas

## 🕹️ Mecânicas do Jogo

### Sistema de Pontuação

- ✅ **Acerto**: Feedback positivo e próxima solicitação
- ❌ **Erro**: Perda de 15% de segurança + feedback explicativo
- 💀 **Game Over**: Quando a segurança chega a 0%

### Feedback Educativo

Cada decisão errada inclui uma explicação detalhada do erro cometido e dicas para evitar o mesmo problema no futuro.

## 💻 Requisitos

### Para Jogar

- **Windows**: Windows 7 ou superior
- **macOS**: macOS 10.12 ou superior
- **Web**: Navegador moderno com suporte a WebGL 2.0
- **RAM**: 512 MB mínimo
- **Espaço em disco**: 50 MB

### Para Desenvolvimento

- Godot Engine 4.5+
- Git (para controle de versão)
- Editor de código (recomendado: VSCode com extensão Godot)

## 📥 Instalação

### Baixar Executável

1. Acesse a [página de releases](https://github.com/Gwin14/Click_Click_Here/releases)
2. Baixe o arquivo correspondente ao seu sistema operacional:
   - **Windows**: `Cyber Guard.exe`
   - **macOS**: `Click! Click Here!.dmg`
   - **Web**: Acesse o link direto ou faça download dos arquivos HTML

### Compilar do Código-Fonte

```bash
# Clone o repositório
git clone https://github.com/Gwin14/Click_Click_Here.git

# Abra o projeto no Godot Engine 4.5
# File > Open Project > Selecione a pasta do projeto

# Execute o jogo
# Pressione F5 ou clique no botão Play
```

## 🎮 Controles

- **Mouse**: Navegação e interação
- **Clique duplo**: Abrir ícones da área de trabalho
- **Arrastar**: Mover janelas e ícones
- **Botões de UI**: 
  - ✅ Aprovar solicitação
  - ❌ Negar solicitação
  - ❌ Fechar janelas

### Atalhos

- **ESC**: Menu de pausa (em desenvolvimento)
- **Clique duplo no ícone Desligar**: Sair do jogo

## 📁 Estrutura do Projeto

```
click-click-here/
├── Assets/                     # Recursos visuais e ícones
│   ├── Windows_icons/         # Ícones estilo Windows XP
│   ├── icon.svg               # Ícone do jogo
│   ├── gameIcon.png           # Ícone principal
│   ├── xp_wallpaper.jpg       # Papel de parede XP
│   └── yellow_wallpaper.png   # Papel de parede menu
│
├── Musicas/                   # Arquivos de áudio
│   ├── musica1.wav
│   ├── musica2.wav
│   └── musica3.wav
│
├── scenes/                    # Cenas do Godot
│   ├── Main.tscn             # Cena principal do jogo
│   ├── start_menu.tscn       # Menu inicial
│   └── huds/                 # Interfaces
│       ├── hud_email.tscn    # Janela de e-mails
│       ├── hud_tasks.tscn    # Janela do manual
│       └── hud_musicas.tscn  # Player de música
│
├── scripts/                   # Scripts GDScript
│   ├── Main.gd               # Lógica principal
│   ├── solicitacoes.gd       # Base de dados de e-mails
│   ├── desktop_icons.gd      # Comportamento dos ícones
│   ├── gradanddrop.gd        # Sistema de arrastar janelas
│   ├── hud_musicas.gd        # Controle do player
│   └── start_menu.gd         # Lógica do menu
│
├── Shaders/                   # Shaders personalizados
│   ├── xp.gdshader           # Efeito visual XP
│   └── profile.gdshader      # Avatar circular
│
├── .gitignore
├── LICENSE
├── project.godot             # Configuração do projeto
├── export_presets.cfg        # Configurações de exportação
└── README.md                 # Este arquivo
```

## 🛠️ Tecnologias Utilizadas

- **Engine**: Godot 4.5
- **Linguagem**: GDScript
- **API Externa**: [Random User Generator](https://randomuser.me/) para avatares
- **Renderização**: OpenGL (GL Compatibility)
- **Áudio**: WAV (formato sem compressão)
- **Shaders**: GLSL (Godot Shader Language)

## 🤝 Contribuindo

Contribuições são bem-vindas! Siga os passos abaixo:

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/NovaFuncionalidade`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova funcionalidade'`)
4. Push para a branch (`git push origin feature/NovaFuncionalidade`)
5. Abra um Pull Request

### Diretrizes

- Mantenha o código limpo e comentado
- Teste todas as mudanças antes de enviar
- Siga o padrão de nomenclatura do projeto
- Adicione novos e-mails em `scripts/solicitacoes.gd` seguindo o formato existente

### Ideias para Contribuir

- [ ] Adicionar mais solicitações de phishing
- [ ] Sistema de níveis de dificuldade
- [ ] Placar de pontuações
- [ ] Modo multiplayer educativo
- [ ] Tradução para outros idiomas
- [ ] Tutorial interativo
- [ ] Conquistas e badges

## 👥 Créditos

**Desenvolvimento**: Equipe Senac
- **Criador Original**: Fábio Santos (2025)

**Recursos**:
- Ícones: Estilo Windows XP (domínio público)
- API de Avatares: Random User Generator

**Agradecimentos Especiais**:
- Comunidade Godot Engine
- Comunidade de segurança cibernética

## 📄 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

```
MIT License

Copyright (c) 2025 Fábio Santos

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

---

## 🎓 Uso Educacional

Este jogo foi desenvolvido com propósitos educacionais e pode ser usado livremente em:

- 🏫 Escolas e universidades
- 🏢 Treinamentos corporativos de segurança
- 📚 Workshops de conscientização
- 🎮 Eventos de gamificação educacional

### Materiais de Apoio

Para educadores interessados em usar o jogo, disponibilizamos:

1. **Guia do Professor**: Explicações sobre cada tipo de ataque
2. **Planos de Aula**: Sugestões de atividades complementares
3. **Avaliações**: Questionários baseados no conteúdo do jogo

---

<div align="center">

**Desenvolvido com ❤️ e segurança em mente**

[⬆ Voltar ao topo](#-click-click-here)

</div>
