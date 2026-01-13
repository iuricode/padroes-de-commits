#!/bin/bash

# Script shell para facilitar a criacao de commits semanticos

echo "Selecione o tipo de commit:"
echo "1. feat: Novo recurso ✨"
echo "2. fix: Correção de bug 🐛"
echo "3. docs: Documentação 📚"
echo "4. test: Testes 🧪"
echo "5. build: Build ➕"
echo "6. perf: Performance ⚡"
echo "7. style: Estilo de código 🎨"
echo "8. refactor: Refatoração ♻️"
echo "9. chore: Tarefas 🔧"
echo "10. ci: Integração contínua 🧱"
echo "11. raw: Dados RAW 🗃️"
echo "12. cleanup: Limpeza de código 🧹"
echo "13. remove: Remoção de arquivos 🗑️"
echo "14. security: Segurança 🔒"
echo ""


read -p "Digite o número correspondente ao tipo de commit: " commit_type


case $commit_type in
  1) type="feat"; emoji="✨";;
  2) type="fix"; emoji="🐛";;
  3) type="docs"; emoji="📚";;
  4) type="test"; emoji="🧪";;
  5) type="build"; emoji="➕";;
  6) type="perf"; emoji="⚡";;
  7) type="style"; emoji="🎨";;
  8) type="refactor"; emoji="♻️";;
  9) type="chore"; emoji="🔧";;
  10) type="ci"; emoji="🧱";;
  11) type="raw"; emoji="🗃️";;
  12) type="cleanup"; emoji="🧹";;
  13) type="remove"; emoji="🗑️";;
  14) type="security"; emoji="🔒";;
  *) echo "Tipo de commit inválido"; exit 1;;
esac


read -p "Digite a mensagem do commit: " message


commit_message="[$type] $emoji: $message"
git commit -a -m "$commit_message"

echo "Commit criado com sucesso: $commit_message"
