# Padrões de commits 📜

De acordo com a documentação do **[Conventional Commits](https://www.conventionalcommits.org/pt-br)**, commits semânticos são uma convenção simples para ser utilizada nas mensagens de commit. Essa convenção define um conjunto de regras para criar um histórico de commit explícito, o que facilita a criação de ferramentas automatizadas.

Esses commits auxiliarão você e sua equipe a entenderem de forma facilitada quais alterações foram realizadas no trecho de código que foi commitado.

Essa identificação ocorre por meio de uma palavra e emoji que identifica se aquele commit realizado se trata de uma alteração de código, atualização de pacotes, documentação, alteração de visual, teste...

## Índice 🧭

- [Formato da mensagem](#formato-da-mensagem-)
- [Tipo e descrição](#tipo-e-descrição-)
- [Validando commits com o hook `commit-msg`](#-validando-commits-com-o-hook-commit-msg)
- [Recomendações](#recomendações-)
- [Complementos de commits](#complementos-de-commits-)
- [Padrões de emojis](#padrões-de-emojis-)
- [Exemplos](#-exemplos)
- [Principais comandos do Git](#principais-comandos-do-git-)
- [Glossário](#glossário-)
- [Contribuição](#contribuição-)

## Formato da mensagem 🧩

```text
:emoji: tipo(escopo opcional): descrição
```

- `:emoji:` - Representa o commit visualmente (veja a [tabela de emojis](#padrões-de-emojis-)). É recomendado, mas o hook aceita a mensagem sem ele. Pode ser o código (`:sparkles:`) ou o próprio emoji (✨).
- `tipo` - Um dos [tipos](#tipo-e-descrição-) abaixo, como `feat` ou `fix`.
- `(escopo)` - Opcional. Indica a área afetada, como em `feat(auth): ...`.
- `!` - Opcional. Indica uma mudança que quebra a compatibilidade (_breaking change_), como em `feat(api)!: ...`.
- `descrição` - Resumo curto do que foi feito.

Exemplo: `:sparkles: feat(auth): adicionar página de login`

## Tipo e descrição 🦄

O commit semântico possui os elementos estruturais abaixo (tipos), que informam a intenção do seu commit ao utilizador(a) de seu código.

- `feat` - Commits do tipo feat indicam que seu trecho de código está incluindo um **novo recurso** (se relaciona com o MINOR do versionamento semântico).

- `fix` - Commits do tipo fix indicam que seu trecho de código commitado está **solucionando um problema** (bug fix), (se relaciona com o PATCH do versionamento semântico).

- `docs` - Commits do tipo docs indicam que houve **mudanças na documentação**, como por exemplo no Readme do seu repositório. (Não inclui alterações em código).

- `test` - Commits do tipo test são utilizados quando são realizadas **alterações em testes**, seja criando, alterando ou excluindo testes unitários. (Não inclui alterações em código)

- `build` - Commits do tipo build são utilizados quando são realizadas modificações em **arquivos de build e dependências**.

- `perf` - Commits do tipo perf servem para identificar quaisquer alterações de código que estejam relacionadas a **performance**.

- `style` - Commits do tipo style indicam que houve alterações referentes a **formatações de código**, semicolons, trailing spaces, lint... (Não inclui alterações em código).

- `refactor` - Commits do tipo refactor referem-se a mudanças devido a **refatorações que não alterem sua funcionalidade**, como por exemplo, uma alteração no formato como é processada determinada parte da tela, mas que manteve a mesma funcionalidade, ou melhorias de performance devido a um code review.

- `chore` - Commits do tipo chore indicam **atualizações de tarefas** de build, configurações de administrador, pacotes... como por exemplo adicionar um pacote no gitignore. (Não inclui alterações em código)

- `ci` - Commits do tipo ci indicam mudanças relacionadas a **integração contínua** (_continuous integration_).

- `raw` - Commits do tipo raw indicam mudanças relacionadas a arquivos de configurações, dados, features, parâmetros.

- `cleanup` - Commits do tipo cleanup são utilizados para remover código comentado, trechos desnecessários ou qualquer outra forma de limpeza do código-fonte, visando aprimorar sua legibilidade e manutenibilidade.

- `remove` - Commits do tipo remove indicam a exclusão de arquivos, diretórios ou funcionalidades obsoletas ou não utilizadas, reduzindo o tamanho e a complexidade do projeto e mantendo-o mais organizado.

- `init` - Commits do tipo init indicam o **commit inicial** do projeto.

- `revert` - Commits do tipo revert indicam que um **commit anterior foi revertido**.

- `security` - Commits do tipo security indicam alterações relacionadas à **segurança da aplicação**, como correção de vulnerabilidades, falhas de autenticação ou autorização, exposição indevida de dados e hardening de configurações.

## 🔧 Validando commits com o hook `commit-msg`

O hook [`commit-msg.sh`](commit-msg.sh) roda a cada `git commit` e bloqueia mensagens que não seguem o [formato](#formato-da-mensagem-). Mensagens geradas pelo próprio Git (`Merge ...`, `Revert "..."`, `fixup! ...`) passam sem validação.

### Instalação automática ⚡

**Requisitos:** [Git](https://git-scm.com/downloads) instalado e um terminal com Bash. No Windows, use o **Git Bash**, que já vem com o Git.

1. Baixe este repositório:

```bash
git clone https://github.com/iuricode/padroes-de-commits.git
```

2. Instale o hook no seu projeto, informando o caminho dele (sem informar, o script instala na pasta atual):

```bash
./padroes-de-commits/install.sh caminho/do/seu-projeto
```

O script copia o `commit-msg.sh` para a pasta de hooks do projeto (respeitando o `core.hooksPath`, se existir) e dá a permissão de execução. Se já existir um hook `commit-msg` diferente, ele é salvo como `commit-msg.bak`.

3. Teste o hook. Este commit deve ser bloqueado:

```bash
git commit --allow-empty -m "mensagem fora do padrão"
```

Já mensagens como `:sparkles: feat: adicionar funcionalidade xyz` ou `fix: corrigir bug` são aceitas.

### Instalação manual 📋

Copie o arquivo para a pasta de hooks do seu projeto, renomeando-o para `commit-msg` (sem extensão), e dê a permissão de execução:

```bash
cp caminho/para/commit-msg.sh .git/hooks/commit-msg
chmod +x .git/hooks/commit-msg
```

> **Nota:** Substitua `caminho/para/commit-msg.sh` pelo caminho real do arquivo. Se a pasta `.git/hooks` não existir, crie-a com `mkdir -p .git/hooks`.

### Para todos os seus projetos 🌍

Para aplicar o hook em todos os repositórios da sua máquina, use uma pasta de hooks global:

```bash
mkdir -p ~/.git-hooks
cp commit-msg.sh ~/.git-hooks/commit-msg
chmod +x ~/.git-hooks/commit-msg
git config --global core.hooksPath ~/.git-hooks
```

> **Atenção:** com o `core.hooksPath` global, o Git passa a ignorar os hooks da pasta `.git/hooks` de cada repositório.

### Com o framework `pre-commit` 🔌

Se o seu projeto usa o [pre-commit](https://pre-commit.com), este repositório já traz o arquivo `.pre-commit-hooks.yaml`. Adicione o hook ao `.pre-commit-config.yaml` do seu projeto:

```yaml
repos:
  - repo: https://github.com/iuricode/padroes-de-commits
    rev: v1.0.0
    hooks:
      - id: padroes-de-commits
```

Depois, instale o hook do estágio `commit-msg`:

```bash
pre-commit install --hook-type commit-msg
```

### Personalize o script (opcional) 🎨

Se necessário, abra o arquivo `commit-msg` instalado em um editor de texto e altere as variáveis `TYPES` (tipos aceitos) e `CONVENTIONAL_COMMIT_REGEX` (formato da mensagem) para atender às necessidades do seu projeto.

### Outros scripts 🧰

- [`push.sh`](push.sh) - Assistente interativo: você escolhe o tipo, digita a mensagem e ele cria o commit (`git commit -a`, dos arquivos já rastreados) no formato `:emoji: tipo: mensagem`.
- [`prepare-commit-msg.sh`](prepare-commit-msg.sh) - Experimental: sugere a mensagem de commit com IA a partir do `git diff --staged`, usando o serviço [ai-commit-hooks](https://github.com/tiagolofi/ai-commit-hooks), que precisa estar rodando localmente.

## Recomendações 🎉

- Adicione um tipo consistente com o título do conteúdo.
- Recomendamos que a primeira linha tenha no máximo 4 palavras.
- Para descrever com detalhes, usar a descrição do commit.
- Usar um emoji no início da mensagem de commit representando o commit.
- Os links precisam ser adicionados em sua forma mais autêntica, ou seja: sem encurtadores de link e links afiliados.

## Complementos de commits 💻

- **Rodapé:** informação sobre o revisor e número do card no Trello ou Jira. Exemplo: Reviewed-by: Elisandro Mello Refs #133
- **Corpo:** descrições mais precisas do que está contido no commit, apresentando impactos e os motivos pelos quais foram empregadas as alterações no código, como também instruções essenciais para intervenções futuras. Exemplo: see the issue for details on typos fixed.
- **Descrições:** uma descrição sucinta da mudança. Exemplo: correct minor typos in code

## Padrões de emojis 💈

<table>
  <thead>
    <tr>
      <th>Tipo do commit</th>
      <th>Emoji</th>
      <th>Palavra-chave</th>
    </tr>
  </thead>
 <tbody>
    <tr>
      <td>Acessibilidade</td>
      <td>♿ <code>:wheelchair:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Adicionando um teste</td>
      <td>✅ <code>:white_check_mark:</code></td>
      <td><code>test</code></td>
    </tr>
    <tr>
      <td>Atualizando a versão de um submódulo</td>
      <td>⬆️ <code>:arrow_up:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Retrocedendo a versão de um submódulo</td>
      <td>⬇️ <code>:arrow_down:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Adicionando uma dependência</td>
      <td>➕ <code>:heavy_plus_sign:</code></td>
      <td><code>build</code></td>
    </tr>
    <tr>
      <td>Alterações de revisão de código</td>
      <td>👌 <code>:ok_hand:</code></td>
      <td><code>style</code></td>
    </tr>
    <tr>
      <td>Animações e transições</td>
      <td>💫 <code>:dizzy:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Arquivo .gitignore</td>
      <td>🙈 <code>:see_no_evil:</code></td>
      <td><code>chore</code></td>
    </tr>
    <tr>
      <td>Bugfix</td>
      <td>🐛 <code>:bug:</code></td>
      <td><code>fix</code></td>
    </tr>
    <tr>
      <td>Comentários</td>
      <td>💡 <code>:bulb:</code></td>
      <td><code>docs</code></td>
    </tr>
    <tr>
      <td>Commit inicial</td>
      <td>🎉 <code>:tada:</code></td>
      <td><code>init</code></td>
    </tr>
    <tr>
      <td>Configuração</td>
      <td>🔧 <code>:wrench:</code></td>
      <td><code>chore</code></td>
    </tr>
    <tr>
      <td>Deploy</td>
      <td>🚀 <code>:rocket:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Documentação</td>
      <td>📚 <code>:books:</code></td>
      <td><code>docs</code></td>
    </tr>
    <tr>
      <td>Em progresso</td>
      <td>🚧 <code>:construction:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Estilização de interface</td>
      <td>💄 <code>:lipstick:</code></td>
      <td><code>feat</code></td>
    </tr>
    <tr>
      <td>Infraestrutura</td>
      <td>🧱 <code>:bricks:</code></td>
      <td><code>ci</code></td>
    </tr>
    <tr>
      <td>Lista de ideias (tasks)</td>
      <td>🔜 <code> :soon: </code></td>
      <td></td>
    </tr>
    <tr>
      <td>Mocks</td>
      <td>🤡 <code>:clown_face:</code></td>
      <td><code>test</code></td>
    </tr>
    <tr>
      <td>Mover/Renomear</td>
      <td>🚚 <code>:truck:</code></td>
      <td><code>chore</code></td>
    </tr>
    <tr>
      <td>Novo recurso</td>
      <td>✨ <code>:sparkles:</code></td>
      <td><code>feat</code></td>
    </tr>
    <tr>
      <td>Package.json em JS</td>
      <td>📦 <code>:package:</code></td>
      <td><code>build</code></td>
    </tr>
    <tr>
      <td>Performance</td>
      <td>⚡ <code>:zap:</code></td>
      <td><code>perf</code></td>
    </tr>
    <tr>
        <td>Refatoração</td>
        <td>♻️ <code>:recycle:</code></td>
        <td><code>refactor</code></td>
    </tr>
    <tr>
      <td>Limpeza de Código</td>
      <td>🧹 <code>:broom:</code></td>
      <td><code>cleanup</code></td>
    </tr>
    <tr>
      <td>Removendo um arquivo</td>
      <td>🗑️ <code>:wastebasket:</code></td>
      <td><code>remove</code></td>
    </tr>
    <tr>
      <td>Removendo uma dependência</td>
      <td>➖ <code>:heavy_minus_sign:</code></td>
      <td><code>build</code></td>
    </tr>
    <tr>
      <td>Responsividade</td>
      <td>📱 <code>:iphone:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Revertendo mudanças</td>
      <td>💥 <code>:boom:</code></td>
      <td><code>fix</code></td>
    </tr>
    <tr>
      <td>Segurança</td>
      <td>🔒️ <code>:lock:</code></td>
      <td><code>security</code></td>
    </tr>
    <tr>
      <td>SEO</td>
      <td>🔍️ <code>:mag:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Tag de versão</td>
      <td>🔖 <code>:bookmark:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Teste de aprovação</td>
      <td>✔️ <code>:heavy_check_mark:</code></td>
      <td><code>test</code></td>
    </tr>
    <tr>
      <td>Testes</td>
      <td>🧪 <code>:test_tube:</code></td>
      <td><code>test</code></td>
    </tr>
    <tr>
      <td>Texto</td>
      <td>📝 <code>:pencil:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Tipagem</td>
      <td>🏷️ <code>:label:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Tratamento de erros</td>
      <td>🥅 <code>:goal_net:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Dados</td>
      <td>🗃️ <code>:card_file_box:</code></td>
      <td><code>raw</code></td>
    </tr>
  </tbody>
</table>

## 💻 Exemplos

<table>
  <thead>
    <tr>
      <th>Comando Git</th>
      <th>Resultado no GitHub</th>
    </tr>
  </thead>
 <tbody>
    <tr>
      <td>
        <code>git commit -m ":tada: init: Commit inicial"</code>
      </td>
      <td>🎉 init: Commit inicial</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":books: docs: Atualização do README"</code>
      </td>
      <td>📚 docs: Atualização do README</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":bug: fix: Loop infinito na linha 50"</code>
      </td>
      <td>🐛 fix: Loop infinito na linha 50</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":sparkles: feat: Página de login"</code>
      </td>
      <td>✨ feat: Página de login</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":bricks: ci: Modificação no Dockerfile"</code>
      </td>
      <td>🧱 ci: Modificação no Dockerfile</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":recycle: refactor: Passando para arrow functions"</code>
      </td>
      <td>♻️ refactor: Passando para arrow functions</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":zap: perf: Melhoria no tempo de resposta"</code>
      </td>
      <td>⚡ perf: Melhoria no tempo de resposta</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":boom: fix: Revertendo mudanças ineficientes"</code>
      </td>
      <td>💥 fix: Revertendo mudanças ineficientes</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":lipstick: feat: Estilização CSS do formulário"</code>
      </td>
      <td>💄 feat: Estilização CSS do formulário</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":test_tube: test: Criando novo teste"</code>
      </td>
      <td>🧪 test: Criando novo teste</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":bulb: docs: Comentários sobre a função LoremIpsum( )"</code>
      </td>
      <td>💡 docs: Comentários sobre a função LoremIpsum( )</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":card_file_box: raw: RAW Data do ano aaaa"</code>
      </td>
      <td>🗃️ raw: RAW Data do ano aaaa</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":broom: cleanup: Eliminando blocos de código comentados e variáveis não utilizadas na função de validação de formulário"</code>
      </td>
      <td>🧹 cleanup: Eliminando blocos de código comentados e variáveis não utilizadas na função de validação de formulário</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":wastebasket: remove: Removendo arquivos não utilizados do projeto para manter a organização e atualização contínua"</code>
      </td>
      <td>🗑️ remove: Removendo arquivos não utilizados do projeto para manter a organização e atualização contínua</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":lock: security: corrigir falha de acesso não autenticado no endpoint de usuários"</code>
      </td>
      <td>🔒 security: corrigir falha de acesso não autenticado no endpoint de usuários</td>
    </tr>
  </tbody>
</table>

# Principais comandos do Git 📜

- `git clone url-do-repositorio-no-github` - Clona um repositório remoto existente no GitHub para o seu ambiente local.

- `git init` - Inicializa um novo repositório Git no diretório atual.

- `git add .` - Adiciona todos os arquivos e alterações no diretório atual para a área de stage (preparando-os para o commit).

- `git commit -m "mensagem do commit"` - Registra as alterações adicionadas na área de stage com uma mensagem descritiva sobre o que foi modificado.

- `git branch -M main` - Renomeia a branch atual (master) para main. O -M é usado para forçar a renomeação, movendo a branch se necessário.

- `git remote add origin https://github.com/usuario/nome-do-repositorio.git` - Adiciona um repositório remoto chamado origin ao repositório local. Use `https://github.com/usuario` para configurar o repositório remoto com HTTPS ou `git@github.com:usuario` para configurar com SSH.

- `git push -u origin main` - Envia os commits da branch main do repositório local para o repositório remoto origin e define main como a branch padrão para futuros push e pull. O -u (ou --set-upstream) configura a branch upstream para facilitar os próximos comandos git push e git pull e eliminar a necessidade de especificar a branch.

- `git remote add origin git@github.com:usuario/projeto.git` `git branch -M main` `git push -u origin main` - Quando você já tem um repositório local e quer conectá-lo a um repositório remoto no GitHub, adiciona o repositório remoto, renomeia a branch principal para main e envia os commits iniciais.

- `git fetch` - Busca todas as atualizações do repositório remoto sem integrá-las à branch atual. Isso atualiza as referências remotas.

- `git pull origin main` - Atualiza a branch local main com as mudanças do repositório remoto origin. Combina git fetch e git merge.

- `git push --force-with-lease` - Forma mais segura de forçar o envio de alterações locais para o repositório remoto. Verifica se não houve alterações feitas por outros colaboradores desde sua última atualização local, evitando sobrescrever acidentalmente o trabalho de outros.

- `git revert id_do_commit_que_vai_ser_revertido` - Cria um novo commit que desfaz as alterações feitas pelo commit especificado, preservando o histórico. Útil para desfazer mudanças de forma segura sem reescrever o histórico.

- `git reset --hard id_do_commit_anterior_ao_que_vai_ser_apagado` - Redefine o repositório para o estado do commit especificado, apagando todas as mudanças feitas após esse commit. Ideal para uso local. Para sincronizar remotamente, use `git push --force-with-lease` posteriormente.

- `git commit --amend -m "mensagem_reescrita"` - Altera a mensagem do último commit. Após usar este comando, sincronize remotamente com `git push --force-with-lease`.

- `git cherry-pick HASH_DO_COMMIT` - Utilizado para obter um commit específico. Exemplo de uso: Imagine que você tenha duas branchs (main) e (develop) e na segunda você tem 3 commits mas deseja apenas pegar o primeiro commit dela, com o uso de cherry-pick você pode.

- `git switch <branch>` - Alterna para uma branch diferente no repositório local. Use `git switch -c <branch>` para criar e alternar para uma nova branch.

# Glossário 📖

- `fork` - Cópia de um repositório para a sua própria conta no GitHub. Isso cria um novo repositório em sua conta que é independente do original, permitindo que você faça alterações sem afetar o repositório original.

- `issues` - Ferramenta usada para gerenciar tarefas, pedidos de novos recursos e correções de bugs em projetos de código aberto. As issues devem ser descritas e listadas, permitindo aos colaboradores discutirem e rastrearem o progresso das mesmas.

- `pull request` - Mecanismo usado para submeter alterações propostas ao repositório original. Um pull request é uma solicitação para que os mantenedores do projeto revisem e potencialmente incorporem as alterações. O pull request passará por um processo de avaliação e pode ser aceito ou rejeitado.

- `gist` - Ferramenta que permite o compartilhamento de trechos de código sem a necessidade de criar um repositório completo. Gists podem ser compartilhados publicamente ou de forma privada.

# Contribuição ✨

Ajude a comunidade tornando este projeto ainda mais incrível. Leia como contribuir clicando **[aqui](https://github.com/iuricode/padroes-de-commits/blob/main/CONTRIBUTING.md)** e a **[licença](https://github.com/iuricode/padroes-de-commits/blob/main/LICENSE.md)**. Estou convencido de que juntos alcançaremos coisas incríveis!
