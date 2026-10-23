#!/bin/bash

# Script shell para facilitar a criacao de commits semanticos
# Gera mensagens no formato: :emoji: tipo: descrição

echo "Selecione o tipo de commit:"
echo "1. feat: Novo recurso ✨"
echo "2. fix: Correção de bug 🐛"
echo "3. docs: Documentação 📚"
echo "4. test: Testes 🧪"
echo "5. build: Build ➕"
echo "6. perf: Performance ⚡"
echo "7. style: Estilo de código 👌"
echo "8. refactor: Refatoração ♻️"
echo "9. chore: Tarefas 🔧"
echo "10. ci: Integração contínua 🧱"
echo "11. raw: Dados RAW 🗃️"
echo "12. cleanup: Limpeza de código 🧹"
echo "13. remove: Remoção de arquivos 🗑️"
echo "14. init: Commit inicial 🎉"
echo "15. revert: Reverter mudanças 💥"
echo "16. security: Segurança 🔒"
echo ""


read -p "Digite o número correspondente ao tipo de commit: " commit_type


case $commit_type in
  1) type="feat"; emoji=":sparkles:";;
  2) type="fix"; emoji=":bug:";;
  3) type="docs"; emoji=":books:";;
  4) type="test"; emoji=":test_tube:";;
  5) type="build"; emoji=":heavy_plus_sign:";;
  6) type="perf"; emoji=":zap:";;
  7) type="style"; emoji=":ok_hand:";;
  8) type="refactor"; emoji=":recycle:";;
  9) type="chore"; emoji=":wrench:";;
  10) type="ci"; emoji=":bricks:";;
  11) type="raw"; emoji=":card_file_box:";;
  12) type="cleanup"; emoji=":broom:";;
  13) type="remove"; emoji=":wastebasket:";;
  14) type="init"; emoji=":tada:";;
  15) type="revert"; emoji=":boom:";;
  16) type="security"; emoji=":lock:";;
  *) echo "Tipo de commit inválido"; exit 1;;
esac


read -p "Digite a mensagem do commit: " message

if [ -z "${message// /}" ]; then
  echo "A mensagem do commit não pode ser vazia"
  exit 1
fi


commit_message="$emoji $type: $message"

if git commit -a -m "$commit_message"; then
  echo "Commit criado com sucesso: $commit_message"
else
  echo "Não foi possível criar o commit"
  exit 1
fi
