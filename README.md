# 🦠 Não Seja Infectado!

![Godot Engine](https://img.shields.io/badge/Godot-3.x-blue.svg)
![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Android-lightgrey.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

> Um jogo educativo sobre prevenção e conscientização criado durante a pandemia de COVID-19

**Não Seja Infectado!** é um endless runner inspirado no famoso jogo do dinossauro do Google Chrome, desenvolvido na Godot Engine. O jogo combina diversão com conscientização sobre medidas de prevenção contra vírus.

## 🎮 Sobre o Jogo

Corra pela cidade evitando pessoas que estão tossindo, espirrando ou aglomerando! Mantenha sua barra de infecção baixa e colete itens que podem te ajudar na jornada. Passe pelos postinhos do SUS para fazer testes e ganhar pontos extras.

### 🎯 Objetivo
- **Sobreviva** o máximo de tempo possível
- **Evite** pessoas infectadas (tosses, espirros, aglomerações)
- **Colete** itens de prevenção
- **Mantenha** sua barra de infecção baixa
- **Visite** postinhos do SUS para ganhar pontos extras

## 🕹️ Como Jogar

### Controles
- **Espaço** ou **Seta para Cima**: Pular
- **Toque na tela** (Android): Pular
- **Escape**: Pausar jogo

### Mecânicas
1. **Pule** para evitar obstáculos (pessoas tossindo/espirrando)
2. **Colete** itens de prevenção durante o percurso
3. **Monitore** sua barra de infecção no canto da tela
4. **Passe** pelos postinhos do SUS com infecção baixa para ganhar pontos

## 🏥 Itens e Power-ups

| Item | Efeito | Descrição |
|------|--------|-----------|
| 🧴 **Álcool em Gel** | Reduz infecção | Diminui sua barra de infecção |
| 😷 **Máscara** | Invulnerabilidade temporária | Te protege por alguns segundos |
| 💊 **Cloroquina** | Sem efeito | Não faz nada (crítica humorística) |

## ⚠️ Obstáculos

- **Pessoas Tossindo**: Aumentam a infecção ao contato
- **Pessoas Espirrando**: Aumentam a infecção ao contato  
- **Aglomerações**: Aparecem em níveis mais altos, são obstáculos maiores

## 🏗️ Tecnologias Utilizadas

- **Engine**: Godot 3.x
- **Linguagem**: GDScript
- **Plataformas**: Windows, Android
- **Integração**: Google Play Games Services
- **Monetização**: AdMob (Android)

## 📱 Recursos

### Funcionalidades
- Sistema de pontuação progressiva
- Conquistas via Google Play Games
- Ciclo dia/noite automático
- Dificuldade progressiva
- Sistema de pause/resume
- Suporte para dispositivos móveis
- Anúncios integrados (AdMob)

### Sistema de Progressão
- **Dificuldade**: Aumenta automaticamente com o tempo
- **Velocidade**: Incrementa conforme a dificuldade
- **Spawning**: Inimigos aparecem mais frequentemente
- **Obstáculos especiais**: Aglomerações desbloqueadas após nível 20

## 🛠️ Instalação e Execução

### Pré-requisitos
- Godot Engine 3.x
- Para Android: SDK configurado

### Como executar
1. Clone o repositório:
   ```bash
   git clone https://github.com/itsManeka/godot-nao-seja-infectado.git
   ```
2. Abra o projeto na Godot Engine
3. Execute o projeto ou exporte para sua plataforma desejada

### Estrutura do Projeto
```
📁 scenes/          # Cenas do jogo
├── 📁 jogador/     # Scripts e cenas do jogador
├── 📁 inimigos/    # Obstáculos e inimigos
├── 📁 itens/       # Power-ups e coletáveis
├── 📁 interface/   # UI e menus
└── 📁 scripts/     # Scripts globais

📁 ressources/      # Assets visuais e sonoros
├── 📁 sounds/      # Efeitos sonoros
└── 📁 fonts/       # Fontes personalizadas

📁 modulos/         # Módulos de integração
├── 📁 admob/       # Integração AdMob
└── 📁 play_game_services/ # Google Play Games
```

## 🎨 Assets e Arte

O jogo utiliza arte pixel art customizada com temática de pandemia:
- Sprites de personagens com diferentes visuais
- Cenários urbanos com parallax scrolling
- Animações de obstáculos (tosse, espirro)
- Interface minimalista e clara

## 🏆 Conquistas

O jogo inclui sistema de conquistas via Google Play Games:
- Conquistas por número de pulos
- Conquistas por sobrevivência noturna
- Sistema de leaderboards

## 📄 Contexto e Propósito

Este jogo foi desenvolvido durante a pandemia de COVID-19 com o objetivo de:
- **Educar** sobre medidas de prevenção
- **Conscientizar** de forma lúdica sobre distanciamento social
- **Desmistificar** tratamentos sem eficácia comprovada
- **Valorizar** o sistema público de saúde (SUS)

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para:
- Reportar bugs
- Sugerir melhorias
- Adicionar novas funcionalidades
- Melhorar a documentação

## 📜 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

## 👨‍💻 Autor

- **Emanuel Ozorio Dias**

---

**Lembre-se**: Use máscara, mantenha distanciamento e não seja infectado! 😷
