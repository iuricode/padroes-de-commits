#!/usr/bin/env bash

# Instala o hook commit-msg em um repositório Git.
#
# Uso:
#   ./install.sh                         instala no repositório da pasta atual
#   ./install.sh caminho/do/repositorio  instala em outro repositório

set -e

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    sed -n '3,7p' "$0" | sed 's/^# \{0,1\}//'
    exit 0
fi

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
HOOK_SOURCE="$SCRIPT_DIR/commit-msg.sh"
TARGET=${1:-.}

if [ ! -f "$HOOK_SOURCE" ]; then
    echo "ERRO: arquivo commit-msg.sh não encontrado em $SCRIPT_DIR"
    exit 1
fi

if ! git -C "$TARGET" rev-parse --git-dir > /dev/null 2>&1; then
    echo "ERRO: '$TARGET' não é um repositório Git."
    exit 1
fi

# O Git resolve o caminho dos hooks (respeita core.hooksPath e worktrees),
# relativo à pasta do repositório.
HOOKS_DIR=$(git -C "$TARGET" rev-parse --git-path hooks)
case $HOOKS_DIR in
    /* | [A-Za-z]:*) ;;
    *) HOOKS_DIR="$TARGET/$HOOKS_DIR" ;;
esac

HOOK_DEST="$HOOKS_DIR/commit-msg"

mkdir -p "$HOOKS_DIR"

if [ -f "$HOOK_DEST" ] && ! cmp -s "$HOOK_SOURCE" "$HOOK_DEST"; then
    cp "$HOOK_DEST" "$HOOK_DEST.bak"
    echo "Já existia um hook commit-msg diferente. Backup salvo em: $HOOK_DEST.bak"
fi

cp "$HOOK_SOURCE" "$HOOK_DEST"
chmod +x "$HOOK_DEST"

echo "Hook instalado em: $HOOK_DEST"
echo "Teste com: git commit --allow-empty -m \"mensagem fora do padrão\" (deve ser bloqueado)"
