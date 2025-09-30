# 🤝 Contribuindo para "Não Seja Infectado!"

Obrigado por considerar contribuir para nosso projeto! Este documento fornece diretrizes para contribuições.

## 📋 Como Contribuir

### 🐛 Reportando Bugs

Se você encontrou um bug, por favor:

1. **Verifique** se já não existe uma issue similar
2. **Crie uma nova issue** com:
   - Descrição clara do problema
   - Passos para reproduzir
   - Comportamento esperado vs atual
   - Screenshots (se aplicável)
   - Informações do sistema (SO, versão do Godot)

### 💡 Sugerindo Melhorias

Para sugestões de novas funcionalidades:

1. **Abra uma issue** com tag `enhancement`
2. **Descreva** a funcionalidade proposta
3. **Explique** por que seria útil
4. **Considere** a complexidade de implementação

### 🔧 Contribuições de Código

#### Pré-requisitos
- Godot Engine 3.x instalado
- Conhecimento básico em GDScript
- Git configurado

#### Processo
1. **Fork** o repositório
2. **Crie** uma branch para sua feature: `git checkout -b feature/nova-funcionalidade`
3. **Implemente** suas mudanças
4. **Teste** suas alterações
5. **Commit** com mensagens descritivas
6. **Push** para sua branch: `git push origin feature/nova-funcionalidade`
7. **Abra** um Pull Request

#### Padrões de Código

##### GDScript
```gdscript
# Use snake_case para variáveis e funções
var velocidade_jogador = 100
func calcular_pontuacao():
    pass

# Use PascalCase para classes e nós
class_name JogadorController

# Comente código complexo
# Calcula a nova velocidade baseada na dificuldade
velocidade_atual = velocidade_base * (1 + dificuldade * 0.1)
```

##### Estrutura de Arquivos
- **Scripts**: Sempre em `scenes/` com as respectivas cenas
- **Assets**: Organizados por tipo em `ressources/`
- **Cenas**: Estrutura hierárquica lógica

#### Diretrizes de Commits
- Use português brasileiro
- Seja descritivo mas conciso
- Prefixos sugeridos:
  - `feat:` para novas funcionalidades
  - `fix:` para correções
  - `docs:` para documentação
  - `refactor:` para refatoração
  - `test:` para testes

Exemplos:
```
feat: adiciona power-up de velocidade
fix: corrige colisão com obstáculos grandes
docs: atualiza instruções de instalação
```

## 🎮 Áreas de Contribuição

### 🎨 Arte e Assets
- Sprites de novos personagens
- Novos cenários ou fundos
- Efeitos visuais
- Ícones e UI

### 🔊 Áudio
- Efeitos sonoros
- Música de fundo
- Áudio para novos power-ups

### 💻 Programação
- Novas mecânicas de jogo
- Otimizações de performance
- Correções de bugs
- Integração com novas plataformas

### 📖 Documentação
- Melhoria do README
- Tutoriais de jogabilidade
- Documentação técnica
- Tradução para outros idiomas

## 🧪 Testando

Antes de submeter código:

1. **Execute** o jogo e teste todas as funcionalidades
2. **Verifique** se não há erros no console
3. **Teste** em diferentes resoluções
4. **Confirme** compatibilidade mobile (se aplicável)

## 📱 Considerações Específicas

### Mobile (Android)
- Teste controles touch
- Verifique performance em dispositivos de baixo desempenho
- Confirme integração com Google Play Games (se modificado)

### Desktop
- Teste todos os controles de teclado
- Verifique comportamento em diferentes resoluções
- Confirme que pause/resume funciona corretamente

## 🤔 Dúvidas?

- **Issues**: Para bugs e sugestões
- **Discussions**: Para perguntas gerais sobre o projeto
- **Email**: [emanuel.ozoriodias@gmail.com](mailto:emanuel.ozoriodias@gmail.com)

## 🎯 Valores do Projeto

Este projeto foi criado com propósito educativo. Ao contribuir, considere:

- **Educação**: Mantém o aspecto educativo sobre prevenção
- **Diversão**: Gameplay deve ser envolvente
- **Acessibilidade**: Jogo deve ser acessível a diferentes públicos
- **Responsabilidade**: Informações de saúde devem ser precisas

---

**Obrigado por ajudar a melhorar o "Não Seja Infectado!"** 🦠💙
