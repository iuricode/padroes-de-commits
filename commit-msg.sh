#!/usr/bin/env bash

# Path to the commit message file (provided by Git).
COMMIT_MSG_FILE=$1

# Valida apenas o assunto (primeira linha que não seja vazia nem comentário).
SUBJECT=$(grep -v '^[[:space:]]*#' "$COMMIT_MSG_FILE" | sed -n '/[^[:space:]]/{p;q;}')

# Mensagens geradas pelo próprio Git não precisam seguir o padrão.
GIT_GENERATED_REGEX='^(Merge |Revert "|fixup! |squash! |amend! )'

# Formato: [emoji] <tipo>(<escopo opcional>)[!]: <descrição>
# O emoji é opcional e pode ser um código (:sparkles:) ou o caractere (✨).
TYPES='feat|fix|docs|test|build|perf|style|refactor|chore|ci|raw|cleanup|remove|init|revert|security'
EMOJI='(:[a-z0-9_+-]+:|[^ -~]+)'
CONVENTIONAL_COMMIT_REGEX="^(${EMOJI}[[:space:]]+)?(${TYPES})(\([a-zA-Z0-9_./-]+\))?(!)?:[[:space:]]+[^[:space:]]"

# Em LC_ALL=C o intervalo [^ -~] casa qualquer byte fora do ASCII imprimível.
export LC_ALL=C

if [[ $SUBJECT =~ $GIT_GENERATED_REGEX ]]; then
    exit 0
fi

# Check if the commit message matches the regex
if ! [[ $SUBJECT =~ $CONVENTIONAL_COMMIT_REGEX ]]; then
    echo "ERRO: A mensagem de commit não segue o formato do Conventional Commits."
    echo
    echo "O formato correto da mensagem de commit é obrigatório:"
    echo "  [emoji] <tipo>(<escopo opcional>): <descrição>"
    echo
    echo "Os tipos válidos são:"
    echo "  feat:     Uma nova funcionalidade."
    echo "  fix:      Correção de um bug."
    echo "  docs:     Alterações na documentação."
    echo "  test:     Adicionar ou atualizar testes."
    echo "  build:    Alterações que afetam o sistema de build ou dependências externas."
    echo "  perf:     Melhorias de desempenho."
    echo "  style:    Alterações de estilo de código (formatação, ponto-e-vírgula ausente, etc.)."
    echo "  refactor: Refatoração de código (nem corrige bug nem adiciona funcionalidade)."
    echo "  chore:    Tarefas rotineiras como atualização de dependências ou ferramentas de build."
    echo "  ci:       Alterações nos arquivos de configuração de CI ou scripts."
    echo "  raw:      Alterações em arquivos de configurações, dados, parâmetros."
    echo "  cleanup:  Limpeza de código (remover código comentado, trechos desnecessários)."
    echo "  remove:   Exclusão de arquivos, diretórios ou funcionalidades obsoletas."
    echo "  init:     Commit inicial."
    echo "  revert:   Reverter um commit anterior."
    echo "  security: Alterações relacionadas à segurança da aplicação."
    echo
    echo "Exemplos:"
    echo "  :sparkles: feat(auth): adicionar funcionalidade de login"
    echo "  :bug: fix(api)!: resolver problema de timeout"
    echo "  :books: docs(readme): atualizar instruções de instalação"
    echo "  docs: atualizar instruções de instalação (o emoji é opcional)"
    echo
    exit 1
fi

exit 0
