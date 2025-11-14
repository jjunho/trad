#!/bin/bash
# Script para validar o workflow do GitHub Actions

set -e

echo "=== Validando YAML ==="

# Verificar se o arquivo existe
if [ ! -f .github/workflows/build-pdfs.yml ]; then
    echo "❌ Arquivo workflow não encontrado!"
    exit 1
fi

# Validar sintaxe YAML
if command -v yamllint &> /dev/null; then
    yamllint .github/workflows/build-pdfs.yml
    echo "✅ Sintaxe YAML válida"
else
    echo "⚠️  yamllint não instalado, pulando validação de sintaxe"
fi

# Validar com Python
python3 << 'EOF'
import yaml
import sys

try:
    with open('.github/workflows/build-pdfs.yml', 'r') as f:
        workflow = yaml.safe_load(f)
    
    # Verificações básicas
    assert 'name' in workflow, "Falta campo 'name'"
    assert 'on' in workflow or True in workflow, "Falta campo 'on' (triggers)"
    assert 'jobs' in workflow, "Falta campo 'jobs'"
    assert 'build' in workflow['jobs'], "Falta job 'build'"
    
    steps = workflow['jobs']['build']['steps']
    step_names = [step['name'] for step in steps]
    
    print("\n=== Steps definidos ===")
    for i, name in enumerate(step_names, 1):
        print(f"{i}. {name}")
    
    # Verificar steps críticos
    required = ['Checkout repository', 'Install Pandoc', 'Build PDFs', 'Upload PDF artifacts']
    for req in required:
        assert req in step_names, f"Step obrigatório ausente: {req}"
    
    print("\n✅ Estrutura do workflow válida")
    print(f"✅ {len(steps)} steps configurados")
    
except Exception as e:
    print(f"\n❌ Erro: {e}")
    sys.exit(1)
EOF

echo ""
echo "=== Verificando triggers ==="
grep -A 10 "^on:" .github/workflows/build-pdfs.yml

echo ""
echo "=== Resumo ==="
echo "✅ Workflow validado com sucesso!"
echo "   - Sintaxe YAML correta"
echo "   - Estrutura completa"
echo "   - Triggers configurados"
echo "   - Steps obrigatórios presentes"
