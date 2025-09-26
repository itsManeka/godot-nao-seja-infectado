# 🛠️ Guia de Desenvolvimento

Este documento fornece informações técnicas para desenvolvedores que desejam contribuir ou entender melhor o projeto "Não Seja Infectado!".

## 🏗️ Arquitetura do Projeto

### Estrutura de Cenas

```
MainMenu.tscn           # Menu principal
├── Main.tscn           # Cena principal do jogo
│   ├── Jogador.tscn    # Personagem controlável
│   ├── GUI.tscn        # Interface do usuário
│   └── ParallaxBackground.tscn  # Fundo com parallax
├── GameOver.tscn       # Tela de fim de jogo
└── Creditos.tscn       # Tela de créditos
```

### Scripts Principais

#### Global.gd
- **Propósito**: Singleton para gerenciar estado global
- **Responsabilidades**:
  - Pontuação global
  - Estado de autenticação Google Play Games
  - Controle de primeira execução

```gdscript
# Principais métodos
func get_pontos() -> int
func set_pontos(valor: int)
func is_android() -> bool
```

#### Main.gd
- **Propósito**: Controlador principal do jogo
- **Responsabilidades**:
  - Loop principal de jogo
  - Geração de obstáculos e itens
  - Sistema de dificuldade progressiva
  - Gerenciamento de ciclo dia/noite

#### Jogador.gd
- **Propósito**: Controla comportamento do personagem
- **Responsabilidades**:
  - Física de movimento e pulo
  - Sistema de infecção
  - Estados de invulnerabilidade
  - Detecção de colisões

## ⚙️ Sistemas Principais

### Sistema de Dificuldade

```gdscript
# Aumento de dificuldade a cada 2 segundos
tempo_dificuldade -= delta
if tempo_dificuldade <= 0:
    dificuldade += 1
    # Aumenta velocidade
    if velocidade.x > velocidade_max:
        velocidade.x += -0.9
    
    # Reduz intervalos de spawn
    if intervalo_inimigo_min > intervalo_min_limite:
        intervalo_inimigo_min -= (intervalo_inimigo_min * 0.01)
```

### Sistema de Spawning

#### Obstáculos
- **Intervalo**: Baseado em dificuldade (0.5s - 3.0s)
- **Tipos**: Tossidor, Espirro, Aglomero (após nível 20)
- **Lógica**: Evita spawn consecutivo de obstáculos grandes

#### Itens
- **Intervalo**: 3-11 segundos
- **Tipos**: Álcool, Máscara, Cloroquina
- **Spawn**: Aleatório e independente dos obstáculos

#### Postinhos do SUS
- **Frequência**: A cada 10+ obstáculos (aumenta com dificuldade)
- **Condição**: Substitui obstáculo regular
- **Benefício**: Pontos extras se infecção < 50%

### Sistema de Infecção

```gdscript
# Parâmetros
var infeccao = 0
var max_infeccao = 100

# Infecção por obstáculo
func jogador_infectou(valor):
    if invencivel: return
    infeccao += valor
    infeccao = clamp(infeccao, 0, max_infeccao)
    if infeccao == max_infeccao:
        main.finalizar()
```

### Sistema de Power-ups

#### Álcool em Gel
```gdscript
# Reduz infecção em 30 pontos
jogador.cura(30)
```

#### Máscara
```gdscript
# 3 segundos de invulnerabilidade
jogador.set_invencivel(3.0)
```

#### Cloroquina
```gdscript
# Sem efeito (crítica humorística)
# Apenas som e pontos
```

## 📱 Integração Mobile

### Google Play Games Services

```gdscript
# Conquistas implementadas
const CONQUISTA_PULO_100 = "conquista_pulo_100"
const CONQUISTA_PULO_200 = "conquista_pulo_200" 
const CONQUISTA_CORUJAO = "conquista_corujao"

# Incremento de conquistas
PGS.increment_achievement(PGS.CONQUISTA_PULO_100, 1)
```

### AdMob Integration

```gdscript
# Módulo AdMob para monetização
# Banner e anúncios intersticiais
# Integração em ADS.gd
```

## 🎨 Assets e Recursos

### Sprites
- **Formato**: PNG com import settings otimizadas
- **Estilo**: Pixel art 16x16 base
- **Animação**: AnimationPlayer para sprites animados

### Áudio
- **Formato**: OGG para música, WAV para efeitos
- **Implementação**: AudioStreamPlayer nodes
- **Efeitos**: Pulo, tosse, espirro, colisão

### Fontes
- **Principal**: alterebro-pixel-font.ttf
- **Estilo**: Pixel art que combina com visual

## 🔧 Configurações Importantes

### Project Settings

```ini
# Resolução base
window/size/width = 320
window/size/height = 180

# Stretch mode para escalabilidade
window/stretch/mode = "2d"

# Pixel perfect
quality/2d/use_pixel_snap = true
```

### Input Map
```ini
# Controle principal
pular = [Space, Up Arrow, Touch]
```

## 🧪 Testing Guidelines

### Desktop Testing
1. **Controles**: Teste espaço e seta para cima
2. **Resolução**: Teste diferentes tamanhos de janela
3. **Performance**: Monitor FPS em gameplay longo

### Mobile Testing  
1. **Touch**: Confirme responsividade do toque
2. **Performance**: Teste em dispositivos low-end
3. **Integração**: Verifique Google Play Games
4. **Ads**: Confirme funcionamento do AdMob

### Gameplay Testing
1. **Dificuldade**: Progressão suave e desafiadora
2. **Balanceamento**: Power-ups úteis mas não overpowered
3. **Feedback**: Todas as ações têm feedback visual/sonoro
4. **Edge Cases**: Spawn simultâneo, múltiplas colisões

## 🚀 Build e Deploy

### Desktop (Windows)
```bash
# Export preset: Windows Desktop
# Include templates and dependencies
# Test executable before release
```

### Android
```bash
# Configurar Android SDK
# Configurar keystore para assinatura
# Export preset: Android
# Test APK em dispositivos reais
```

## 📈 Performance Tips

### Otimizações Implementadas
- Object pooling para obstáculos/itens
- Sprites otimizadas (flags/filter = false)
- Parallax com camadas mínimas necessárias

### Monitoring
```gdscript
# Monitor FPS
Engine.get_frames_per_second()

# Memory usage
OS.get_static_memory_usage_by_type()
```

## 🐛 Debugging

### Common Issues
1. **Spawning**: Obstáculos aparecendo muito próximos
2. **Collision**: Múltiplas colisões simultâneas
3. **Performance**: Frame drops em dispositivos antigos
4. **Audio**: Múltiplos sons sobrepostos

### Debug Tools
```gdscript
# Debug prints estratégicos
print("dificuldade: " + str(dificuldade))
print("velocidade: " + str(velocidade.x))

# Visual debugging
get_tree().debug_collisions_hint = true
```

---

Este documento deve ser atualizado conforme o projeto evolui. Para dúvidas específicas, consulte o código-fonte ou abra uma issue no repositório.
