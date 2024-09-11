#!/bin/sh

# Implemente o serviço em https://github.com/tiagolofi/ai-commit-hooks-api
# Mais detalhes em: https://github.com/tiagolofi/ai-commit-hooks

COMMIT_MSG_FILE=$1

GIT_DIFF=$(git diff --staged)

API_RESPONSE=$(
    curl -X 'POST' \
    'http://localhost:8080/commit/gpt-4o-mini' \
    -H 'Token-Consumo: SEU_TOKEN_GERADO_NA_APLICACAO' \
    -H 'Content-Type: text/plain' \
    -d "$GIT_DIFF"
)

COMMIT=$(echo $API_RESPONSE | grep -oP '(?<="respostaGPT4oMini":")[^"]*')

echo "$COMMIT" > temp_msg
cat "$COMMIT_MSG_FILE" >> temp_msg # dê um " " na mensagem de commit
mv temp_msg "$COMMIT_MSG_FILE"
COMMIT_MSG=$(cat "$COMMIT_MSG_FILE")
if [[ -z "$COMMIT_MSG" || "$COMMIT_MSG" =~ ^[[:space:]]*$ ]]; then
    exit 1 # erro: mensagem vazia
fi
