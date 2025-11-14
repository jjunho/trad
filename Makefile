# Variáveis
PANDOC = pandoc
PDF_ENGINE = xelatex
DOCS_DIR = docs
CONFIG_DIR = config
BUILD_DIR = build

# Detectar versão do Pandoc e usar flag apropriada
PANDOC_VERSION := $(shell pandoc --version | head -1 | sed 's/pandoc //')
PANDOC_MAJOR := $(shell echo $(PANDOC_VERSION) | cut -d. -f1)
PANDOC_MINOR := $(shell echo $(PANDOC_VERSION) | cut -d. -f2)

# Pandoc >= 3.2 usa --syntax-highlighting, < 3.2 usa --highlight-style
ifeq ($(shell test $(PANDOC_MAJOR) -gt 3 -o \( $(PANDOC_MAJOR) -eq 3 -a $(PANDOC_MINOR) -ge 2 \); echo $$?),0)
    HIGHLIGHT_FLAG = --syntax-highlighting=tango
else
    HIGHLIGHT_FLAG = --highlight-style=tango
endif

PANDOC_FLAGS = --pdf-engine=$(PDF_ENGINE) \
	--toc \
	--toc-depth=3 \
	--number-sections \
	--shift-heading-level-by=-1 \
	$(HIGHLIGHT_FLAG) \
	--standalone \
	-V geometry:margin=1in \
	-V linkcolor:blue \
	-V urlcolor:blue \
	-V toccolor:black \
	-V lang=pt-BR \
	-V papersize=a4 \
	-V documentclass=article \
	-H $(CONFIG_DIR)/header.tex

# Alvos
SOURCES = $(wildcard $(DOCS_DIR)/*.md)
PDFS = $(patsubst $(DOCS_DIR)/%.md,$(BUILD_DIR)/%.pdf,$(SOURCES))

# Regra padrão
all: $(BUILD_DIR) $(PDFS)

# Criar diretório de build
$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

# Regra genérica para compilar markdown para PDF
$(BUILD_DIR)/%.pdf: $(DOCS_DIR)/%.md $(CONFIG_DIR)/header.tex
	@echo "Compilando $< para $@..."
	@$(PANDOC) $< -o $@ $(PANDOC_FLAGS)
	@echo "✓ $@ gerado com sucesso"

# Limpeza
clean:
	@echo "Removendo arquivos gerados..."
	@rm -rf $(BUILD_DIR)
	@echo "✓ Limpeza concluída"

# Reconstruir tudo
rebuild: clean all

# Phony targets
.PHONY: all clean rebuild