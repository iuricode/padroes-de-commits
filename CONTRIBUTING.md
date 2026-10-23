# Como contribuir? 🤝

Este é um projeto totalmente livre que aceita contribuições via pull requests no GitHub. Este documento alinha as contribuições aos padrões do projeto. Em caso de dúvidas, [abra uma issue](https://github.com/iuricode/padroes-de-commits/issues/new).

## O que você pode contribuir 💡

- Corrigir erros de digitação ou melhorar os textos do [README](README.md).
- Sugerir novos tipos de commit ou emojis (para um tipo novo, abra uma issue antes, para conversarmos).
- Melhorar os scripts: [commit-msg.sh](commit-msg.sh), [push.sh](push.sh), [install.sh](install.sh) e [prepare-commit-msg.sh](prepare-commit-msg.sh).
- Reportar problemas e tirar dúvidas.

## Passos 🚀

1. Crie um fork deste repositório.
2. Crie uma branch a partir da `main`:

   ```bash
   git switch -c minha-contribuicao
   ```

3. Faça as suas alterações.
4. Envie seus commits em português, seguindo o [padrão do projeto](#padrão-dos-commits-).
5. Solicite um pull request com um pequeno resumo sobre o que foi adicionado ou alterado. Se ele resolve uma issue, cite o número dela, como em `Closes #123`.

## Padrão dos commits 📜

Use o mesmo formato que este projeto ensina:

```text
:emoji: tipo(escopo opcional): descrição
```

Exemplo: `:sparkles: feat: Página de login`. Os tipos e os emojis estão no [README](README.md).

Para validar as suas mensagens automaticamente, instale o hook `commit-msg` no seu fork:

```bash
./install.sh
```

## Adicionando um novo tipo de commit 🧩

Um tipo novo precisa ser atualizado em todos estes lugares. Se faltar algum, o hook rejeita o commit ou os scripts ficam diferentes do README:

- [README.md](README.md): a lista de tipos, a tabela de emojis e a tabela de exemplos.
- [commit-msg.sh](commit-msg.sh): a variável `TYPES` e a mensagem de ajuda.
- [push.sh](push.sh): o menu e o `case`.

## Antes de abrir o pull request ✅

- Os links estão na forma mais autêntica, sem encurtadores e sem links afiliados.
- Os scripts alterados foram testados. Para checar a sintaxe: `bash -n nome-do-script.sh`.
- Os seus commits seguem o padrão acima.

## Licença 📄

Ao contribuir, você concorda que a sua contribuição será disponibilizada sob a [licença do projeto](LICENSE.md).
