# Estrutura de Títulos em Markdown para PDFs

## ✅ Estrutura Correta e Completa

Para gerar PDFs corretamente com Pandoc, **SEMPRE** siga esta estrutura:

### 1. Metadados YAML no início do arquivo

```yaml
---
title: "Título do Documento"
subtitle: "Subtítulo (opcional)"
author: "Autor"
date: ""
---
```

### 2. Título principal com `#`

```markdown
# Título do Documento
```

Este título `#` **não será numerado** no PDF final (graças à flag `--shift-heading-level-by=-1` no Makefile).

### 3. Hierarquia de conteúdo

```markdown
## Capítulo 1
(Será numerado como: 1)

### Seção 1.1
(Será numerado como: 1.1)

#### Subseção 1.1.1
(Será numerado como: 1.1.1)

##### Subseção 1.1.1.1
(Será numerado como: 1.1.1.1)

## Capítulo 2
(Será numerado como: 2)

### Seção 2.1
(Será numerado como: 2.1)

### Seção 2.2
(Será numerado como: 2.2)
```

## 📋 Exemplo Completo: Yi Sang

```markdown
---
title: "Yi Sang"
subtitle: "Poeta e Escritor Modernista Coreano"
author: "Wikipédia"
date: ""
---

# Yi Sang

## Informações sobre o autor
← Numerado como 1

- **Nascimento**: ...
- **Morte**: ...

## Biografia
← Numerado como 2

### Infância
← Numerado como 2.1

Texto sobre a infância...

### Emprego e estreia literária
← Numerado como 2.2

### Doença
← Numerado como 2.3

### Os amores de Yi Sang
← Numerado como 2.4

#### Geumhong
← Numerado como 2.4.1

#### Kwon Sun-ok
← Numerado como 2.4.2

#### Byeon Dong-rim
← Numerado como 2.4.3

### Viagem ao Japão e morte
← Numerado como 2.5

### Legado
← Numerado como 2.6

## Avaliação
← Numerado como 3

## Lista de obras
← Numerado como 4

### Romances
← Numerado como 4.1

### Ensaios
← Numerado como 4.2

### Poemas
← Numerado como 4.3
```

## ❌ Erros Comuns

### Erro 1: Não incluir metadados YAML

**NÃO fazer:**

```markdown
# Yi Sang

## Biografia
```

**Resultado:** O título `#` aparecerá numerado ou a numeração começará em 0.1, 0.2...

### Erro 2: Não incluir o título `#` no corpo

**NÃO fazer:**

```markdown
---
title: "Yi Sang"
---

## Biografia
## Obras
```

**Resultado:** As seções aparecerão como 0.1, 0.2 ao invés de 1, 2...

### Erro 3: Múltiplos títulos `#`

**NÃO fazer:**

```markdown
# Yi Sang

# Biografia
# Obras
```

**Resultado:** Cada `#` cria um novo "documento", quebrando a numeração.

## 🔧 Configuração do Makefile

O Makefile do projeto usa a flag `--shift-heading-level-by=-1` que faz:

- `#` → Nível 0 (título do documento, não numerado)
- `##` → Nível 1 (numerado: 1, 2, 3...)
- `###` → Nível 2 (numerado: 1.1, 1.2, 2.1...)
- `####` → Nível 3 (numerado: 1.1.1, 1.1.2...)

## 📚 Regras de Ouro

1. **Sempre iniciar com metadados YAML**
2. **Sempre incluir um único `#` após os metadados** (com o mesmo texto do `title:`)
3. **Usar `##` para capítulos principais** (serão numerados 1, 2, 3...)
4. **Usar `###` para seções** (serão numerados 1.1, 1.2...)
5. **Não pular níveis** (não ir de `##` para `####` diretamente)
6. **Nunca usar múltiplos `#`** no mesmo documento

## ✅ Template para Novos Documentos

```markdown
---
title: "Título do Seu Documento"
subtitle: "Subtítulo Opcional"
author: "Seu Nome"
date: ""
---

# Título do Seu Documento

Introdução ou texto preliminar (opcional).

## Primeira Seção Principal

Conteúdo da primeira seção...

### Subseção 1.1

Conteúdo...

### Subseção 1.2

Conteúdo...

## Segunda Seção Principal

Conteúdo da segunda seção...

### Subseção 2.1

Conteúdo...

## Conclusão

Texto final...
```
