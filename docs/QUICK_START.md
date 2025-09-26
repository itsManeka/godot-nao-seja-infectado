# ⚡ Quick Start Guide

Guia rápido para começar a jogar e desenvolver "Não Seja Infectado!" em poucos minutos.

## 🎮 Para Jogadores
Esse e outros jogos desenvolvidos por mim podem ser jogados no [itch.io](https://itsmaneka.itch.io)

### Controles Básicos

| Ação | Desktop | Mobile |
|------|---------|--------|
| **Pular** | `Espaço` ou `↑` | Toque na tela |
| **Pausar** | `Esc` | Botão de pause |

### Objetivo
🏃‍♂️ **Corra** pela cidade evitando pessoas doentes  
🏥 **Colete** itens de prevenção  
📊 **Mantenha** a barra de infecção baixa  
⭐ **Sobreviva** o máximo possível!

## 👨‍💻 Para Desenvolvedores

### Setup Rápido (< 5 minutos)

```bash
# 1. Clone o repositório
git clone https://github.com/itsManeka/godot-nao-seja-infectado.git
cd godot-nao-seja-infectado

# 2. Abra na Godot Engine 3.x
# Arquivo > Importar > Selecionar project.godot

# 3. Execute o projeto
# Pressione F5 ou clique no botão Play
```

### Primeira Contribuição

```bash
# 1. Faça um fork do repositório
# 2. Clone seu fork
git clone https://github.com/itsManeka/godot-nao-seja-infectado.git

# 3. Crie uma branch para sua feature
git checkout -b minha-feature

# 4. Faça suas alterações
# 5. Commit e push
git add .
git commit -m "feat: adiciona nova funcionalidade"
git push origin minha-feature

# 6. Abra um Pull Request
```

### Estrutura Essencial

```
📁 scenes/
├── Main.tscn          # ← Cena principal do jogo
├── MainMenu.tscn      # ← Menu inicial
├── jogador/           # ← Scripts do personagem
└── scripts/Global.gd  # ← Variáveis globais

📁 ressources/
├── sounds/            # ← Efeitos sonoros
└── *.png             # ← Sprites do jogo
```

### Scripts Importantes

| Arquivo | Função |
|---------|--------|
| `scenes/Main.gd` | 🎮 Loop principal do jogo |
| `scenes/jogador/Jogador.gd` | 🏃‍♂️ Controles do personagem |
| `scenes/scripts/Global.gd` | 🌐 Estado global |

## 🛠️ Desenvolvimento Avançado

### Configuração Completa

Para desenvolvimento completo com todas as funcionalidades:

1. **Instale dependências**:
   - Godot Engine 3.x
   - Android SDK (para builds mobile)
   - Git

2. **Configure integração**:
   - Google Play Games Services
   - AdMob (opcional)

3. **Leia documentação detalhada**:
   - [DEVELOPMENT.md](DEVELOPMENT.md) - Guia técnico completo
   - [DEPLOYMENT.md](DEPLOYMENT.md) - Como fazer build e deploy
   - [CONTRIBUTING.md](../CONTRIBUTING.md) - Como contribuir

### Testing

```bash
# Desktop: Execute na Godot
F5 (ou Play button)

# Mobile: Build e teste
Project > Export > Android > Export Project

# Performance: Use profiler integrado
Debug > Profiler
```

## 🎯 Objetivos Educacionais

Este jogo foi criado para:

### 💡 Conscientização
- Importância do distanciamento social
- Uso correto de equipamentos de proteção
- Papel do sistema público de saúde

### 🎨 Aprendizado Técnico
- Desenvolvimento em Godot Engine
- Pixel art e game design
- Integração com serviços mobile

### 🤝 Colaboração
- Projeto open source para comunidade
- Contribuições educacionais
- Compartilhamento de conhecimento

## 📞 Precisa de Ajuda?

### 🐛 Bugs ou Problemas
- [Abra uma issue](https://github.com/itsManeka/godot-nao-seja-infectado/issues)
- Descreva o problema detalhadamente
- Inclua screenshots se possível

### 💡 Dúvidas de Desenvolvimento
- Consulte [DEVELOPMENT.md](DEVELOPMENT.md)
- Verifique [issues existentes](https://github.com/itsManeka/godot-nao-seja-infectado/issues)
- Use as [discussions](https://github.com/itsManeka/godot-nao-seja-infectado/discussions)

### 🤝 Quer Contribuir?
- Leia [CONTRIBUTING.md](../CONTRIBUTING.md)
- Veja [issues abertas](https://github.com/itsManeka/godot-nao-seja-infectado/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22)
- Comece com issues marcadas como "good first issue"

---

**Divirta-se jogando e desenvolvendo! 🎮💙**

*Lembre-se: Use máscara, mantenha distanciamento e não seja infectado!* 😷
