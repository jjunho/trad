# Projeto de Tradução de Textos Coreanos

[![Build PDFs](https://github.com/SEU_USUARIO/trad/workflows/Build%20PDFs/badge.svg)](https://github.com/SEU_USUARIO/trad/actions)

Projeto profissional para tradução de textos da Wikipédia coreana e outros conteúdos relacionados à cultura coreana para português brasileiro.

## 📁 Estrutura do Projeto

```
trad/
├── docs/              # Documentos traduzidos (Markdown)
├── prompts/           # Prompts para tradução e revisão
├── config/            # Arquivos de configuração (LaTeX, etc.)
├── build/             # PDFs gerados (não versionados)
├── Makefile           # Automação de build
└── README.md          # Documentação do projeto
```

## 🎯 Objetivo

Traduzir artigos e textos da cultura coreana com alta qualidade, mantendo:
- Fidelidade ao conteúdo original
- Romanização adequada de termos coreanos (Hanja + Hangeul)
- Estilo natural em português brasileiro
- Formatação profissional em PDF

## 🔧 Pré-requisitos

- `pandoc` (conversor de documentos)
- `xelatex` (engine LaTeX para suporte a fontes coreanas)
- Fontes necessárias:
  - Palatino Linotype
  - KoPubWorldBatang_Pro Medium

### Instalação no Linux

```bash
# Ubuntu/Debian
sudo apt-get install pandoc texlive-xetex texlive-lang-cjk

# Arch Linux
sudo pacman -S pandoc texlive-core texlive-langchinese
```

## 🚀 Como Usar

### Compilar todos os documentos

```bash
make
```

Os PDFs serão gerados no diretório `build/`.

### Compilar documento específico

```bash
make build/tumbas.pdf
# ou
make build/yi_sang.pdf
```

### Limpar arquivos gerados

```bash
make clean
```

### Reconstruir tudo

```bash
make rebuild
```

## 📝 Fluxo de Trabalho

1. **Tradução**: Use os prompts em `prompts/prompt_traducao.md` para traduzir textos coreanos
2. **Revisão**: Aplique `prompts/prompt_revisao.md` para refinar a tradução
3. **Edição**: Salve o documento final em `docs/nome_do_arquivo.md`
4. **Compilação**: Execute `make` para gerar o PDF em `build/`

## 📚 Documentos Atuais

- **tumbas.md**: Túmulos Reais da Dinastia Joseon (Patrimônio Mundial da UNESCO)
- **yi_sang.md**: Biografia do poeta e escritor Yi Sang

## 🎨 Formatação

Os documentos utilizam:
- Cabeçalho LaTeX customizado (`config/header.tex`)
- Suporte a caracteres coreanos (Hangeul e Hanja)
- Índice automático
- Numeração de seções
- Links coloridos
- Margens de 1 polegada
- Papel A4

## 📋 Convenções de Romanização

Termos coreanos seguem o padrão:

- **Primeira ocorrência**: *Romanização* (Hanja, Hangeul)
  - Exemplo: *Gyeongbokgung* (景福宮, 경복궁)
- **Ocorrências seguintes**: apenas *Romanização*
  - Exemplo: *Gyeongbokgung*

## 🤝 Contribuindo

Para adicionar novos documentos:

1. Crie o arquivo `.md` em `docs/`
2. Siga as convenções de formatação e romanização
3. Execute `make` para verificar a compilação
4. Commit e push

### CI/CD Automático

O projeto possui integração contínua via GitHub Actions:

- **Build automático**: PDFs são compilados a cada push para `main`
- **Artifacts**: PDFs ficam disponíveis para download por 90 dias
- **Releases**: Ao criar tags, PDFs são anexados automaticamente
- **Triggers**: Apenas quando arquivos em `docs/`, `config/` ou `Makefile` mudam

Para criar uma release com PDFs:
```bash
git tag -a v1.0.0 -m "Release versão 1.0.0"
git push origin v1.0.0
```

## 📄 Licença

Este é um projeto de tradução para fins educacionais e de preservação cultural.
