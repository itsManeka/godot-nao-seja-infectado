# 🚀 Guia de Deploy

Este documento descreve como fazer build e deploy do jogo "Não Seja Infectado!" para diferentes plataformas.

## 📋 Pré-requisitos

### Ambiente Base
- **Godot Engine 3.x** (recomendado 3.5+)
- **Git** para controle de versão

### Para Android
- **Android SDK** (API Level 29+)
- **Android NDK** 
- **JDK 8** ou superior
- **Gradle** configurado
- **Keystore** para assinatura (produção)

### Para Desktop
- **Export Templates** da Godot instalados
- **Dependências específicas** do SO de destino

## 🖥️ Deploy Desktop (Windows)

### 1. Configuração do Export Preset

```gdscript
# No Godot Editor:
Project > Export > Add > Windows Desktop

# Configurações importantes:
- Binary Format: 64 bits
- Embed PCK: true (para distribuição single-file)
- Include: Apenas arquivos necessários
```

### 2. Build

```bash
# Via Godot Editor
Project > Export > Windows Desktop > Export Project

# Via Command Line
godot --export "Windows Desktop" ./builds/windows/NaoSejaInfectado.exe
```

### 3. Teste

```bash
# Teste o executável em:
- Windows 10/11 (diferentes versões)
- Diferentes resoluções de tela
- Com/sem placas de vídeo dedicadas
```

### 4. Distribuição

```bash
# Criar arquivo ZIP com:
- NaoSejaInfectado.exe
- README.txt (instruções básicas)
- Pasta de assets (se não embedded)

# Opcionalmente criar installer com:
- NSIS (Nullsoft Scriptable Install System)
- Inno Setup
- WiX Toolset
```

## 📱 Deploy Android

### 1. Configuração Inicial

#### Android SDK Setup
```bash
# Download Android Studio ou SDK tools
# Configure variáveis de ambiente:
export ANDROID_HOME=/path/to/android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# No Godot:
Editor > Editor Settings > Export > Android
- Android SDK Path: /path/to/android/sdk
- Debug Keystore: debug.keystore (desenvolvimento)
```

#### Configuração do Projeto
```xml
<!-- android/AndroidManifest.xml -->
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.WAKE_LOCK" />

<!-- Para Google Play Games -->
<meta-data android:name="com.google.android.gms.games.APP_ID"
           android:value="@string/app_id" />
           
<!-- Para AdMob -->
<meta-data android:name="com.google.android.gms.ads.APPLICATION_ID"
           android:value="ca-app-pub-YOUR_ADMOB_APP_ID~YOUR_ID"/>
```

### 2. Build de Desenvolvimento

```bash
# No Godot Editor:
Project > Export > Add > Android

# Configurações Debug:
- Use Debug Keystore: true
- Export With Debug: true
- Min SDK: 21 (Android 5.0)
- Target SDK: 30+

# Build
Project > Export > Android > Export Project
```

### 3. Build de Produção

#### Criação do Keystore
```bash
# Criar keystore para produção
keytool -genkey -v -keystore release.keystore -alias nao_seja_infectado \
        -keyalg RSA -keysize 2048 -validity 10000

# Configurar no Godot:
- Use Custom Build: true
- Use Debug Keystore: false
- Release User: seu_alias
- Release Password: sua_senha
```

#### Build Release
```bash
# No Godot:
- Export With Debug: false
- Code Signing > Release: configurar keystore

# Gerar APK
Project > Export > Android > Export Project

# Verificar APK
aapt dump badging NaoSejaInfectado.apk
```

### 4. Otimizações Android

#### Performance
```gdscript
# project.godot - configurações otimizadas
[rendering]
quality/intended_usage/framebuffer_allocation.mobile=0
quality/reflections/texture_array_reflections=false
quality/filters/use_nearest_mipmap_filter=true

# Texturas otimizadas
[importer_defaults]
texture={
"compress/mode": 2,  # VRAM Compressed
"compress/lossy_quality": 0.7,
"detect_3d": false,
"flags/filter": false
}
```

#### APK Size
```bash
# Reduzir tamanho do APK:
- Remover assets não utilizados
- Comprimir texturas adequadamente
- Usar export templates customizados
- Ativar APK Split (se necessário)
```

## 🔐 Configuração de Serviços

### Google Play Games Services

#### 1. Console do Google Play
```bash
# 1. Criar app no Google Play Console
# 2. Configurar Play Games Services
# 3. Criar conquistas:
   - Saltador Iniciante (100 pulos)
   - Saltador Profissional (200 pulos)  
   - Corujão (sobreviver à noite)
# 4. Obter APP_ID
```

#### 2. Configuração no Projeto
```gdscript
# modulos/play_game_services/pgs.gd
const CONQUISTA_PULO_100 = "CgkI_YOUR_ACHIEVEMENT_ID"
const CONQUISTA_PULO_200 = "CgkI_YOUR_ACHIEVEMENT_ID"
const CONQUISTA_CORUJAO = "CgkI_YOUR_ACHIEVEMENT_ID"
```

### AdMob Integration

#### 1. Configuração AdMob
```bash
# 1. Criar conta AdMob
# 2. Criar app e unidades de anúncio
# 3. Obter IDs de aplicativo e unidades
```

#### 2. Implementação
```gdscript
# modulos/admob/admob.gd
# Configurar IDs de produção vs desenvolvimento
var banner_id = "ca-app-pub-YOUR_PUBLISHER_ID/BANNER_UNIT_ID"
var interstitial_id = "ca-app-pub-YOUR_PUBLISHER_ID/INTERSTITIAL_UNIT_ID"
```

## 📊 Testes de Deploy

### Checklist Pré-Release

#### Funcionalidade Core
- [ ] Jogo inicia corretamente
- [ ] Controles funcionam (desktop/mobile)
- [ ] Sistema de pontuação funciona
- [ ] Power-ups funcionam corretamente
- [ ] Game over funciona
- [ ] Menu de pause/resume

#### Integração Android
- [ ] Google Play Games conecta
- [ ] Conquistas são desbloqueadas
- [ ] AdMob carrega anúncios
- [ ] Performance aceitável em dispositivos low-end

#### Performance
- [ ] FPS estável (60 FPS desktop, 30+ mobile)
- [ ] Sem vazamentos de memória
- [ ] Tempo de carregamento aceitável
- [ ] Bateria não drena excessivamente (mobile)

### Testes em Dispositivos

#### Desktop
```bash
# Testar em:
- Windows 7/8/10/11
- Diferentes resoluções (1080p, 1440p, 4K)
- Com/sem aceleração de hardware
```

#### Mobile
```bash
# Testar em:
- Android 5.0+ (diferentes versões)
- Dispositivos low-end (2GB RAM)
- Dispositivos high-end
- Diferentes resoluções/densidades
```

## 🌐 Distribuição

### Google Play Store

#### 1. Preparação
```bash
# Assets necessários:
- Ícone high-res (512x512)
- Screenshots (phone, tablet, TV se aplicável)
- Banner (1024x500)
- Descrição em português
- Palavras-chave relevantes
```

#### 2. Upload
```bash
# 1. Console Google Play > Criar aplicativo
# 2. Upload APK/AAB na trilha de produção
# 3. Preencher informações da loja
# 4. Configurar classificação de conteúdo
# 5. Política de privacidade (se necessário)
# 6. Revisar e publicar
```

### Itch.io

#### Desktop
```bash
# 1. Criar conta no itch.io
# 2. Criar projeto
# 3. Upload build Windows
# 4. Configurar página do jogo
# 5. Definir preço (gratuito/pago)
```

### GitHub Releases

```bash
# 1. Tag da versão
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0

# 2. Create release no GitHub
# 3. Upload builds para diferentes plataformas
```

## 🔧 Troubleshooting

### Problemas Comuns

#### Android Build Errors
```bash
# Erro de SDK/NDK
- Verificar paths no Editor Settings
- Reinstalar Android SDK/NDK
- Verificar Java JDK version

# Erro de assinatura
- Verificar keystore path e senhas
- Regenerar keystore se necessário

# Erro de dependências
- Atualizar Gradle wrapper
- Limpar cache do Gradle
```

#### Performance Issues
```bash
# FPS baixo
- Reduzir resolução base
- Otimizar texturas
- Diminuir número de partículas
- Profile com Godot profiler

# Crash em dispositivos antigos
- Testar em dispositivos reais
- Verificar logs do Android
- Reduzir uso de memória
```

## 📈 Monitoring Pós-Deploy

### Analytics
- Crash reports (Google Play Console)
- Performance metrics
- User engagement
- Revenue (se monetizado)

### Updates
```bash
# Workflow de update:
1. Fix bugs/add features
2. Update version numbers
3. Test thoroughly
4. Deploy to beta track first
5. Gradual rollout to production
```

---

Para dúvidas específicas sobre deploy, consulte a documentação oficial da Godot ou abra uma issue no repositório.
