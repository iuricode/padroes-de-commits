<h1 align="center">
📄<br>Padrões de commits 
</h1>

<h1 align="center">
  <img src="gitcommit.png">
</h1>

<p>
  De acordo com a documentação do <strong>Convetional Commits</strong>, Commits Semânticos são uma convenção simples para ser utilizada nas mensagens de commit. Essa convenção define  um conjunto de regras para criar um histórico de commit explícito, o que facilita a criação de ferramentas automatizadas.
</p>

<p>
  Esses commits auxiliarão você e sua equipe a entenderem de forma facilitada quais alterações foram realizadas no trecho de código que foi commitado.
</p>

<p>
  Essa identificação ocorre por meio de uma palavra e emoji que identifica se aquele commit realizado se trata de uma alteração de código, atualização de pacotes, documentação, alteração de visual, teste...
</p>


## 🦄 Tipo e Descrição

O commit semântico possui os elementos estruturais abaixo (tipos), que informam a intenção do seu commit ao utilizador(a) de seu código.

- `fix` - Commits do tipo fix indicam que seu trecho de código commitado está solucionando um problema (bug fix), (se relaciona com o PATCH do versionamento semântico).

- `feat`- Commits do tipo feat indicam que seu trecho de código está incluindo um novo recurso (se relaciona com o MINOR do versionamento semântico).

- `docs` - Commits do tipo docs indicam que houveram mudanças na documentação, como por exemplo no Readme do seu repositório. (Não inclui alterações em código).

- `style` - Commits do tipo style indicam que houveram alterações referentes a formatações de código, semicolons, trailing spaces, lint... (Não inclui alterações em código).

- `refactor` - Commits do tipo refactor referem-se a mudanças devido a refatorações que não alterem sua funcionalidade, como por exemplo, uma alteração no formato como é processada determinada parte da tela, mas que manteve a mesma funcionalidade, ou melhorias de performance devido a um code review.

- `build` - Commits do tipo build são utilizados quando são realizadas modificações em arquivos de build e dependências.

- `test` - Commits do tipo test são utilizados quando são realizadas alterações em testes, seja criando, alterando ou excluindo testes unitários. (Não inclui alterações em código)

- `chore` - Commits do tipo chore indicam atualizações de tarefas de build, configurações de administrador, pacotes... como por exemplo adicionar um pacote no gitignore. (Não inclui alterações em código)


## 🎉 Recomendações

- Adicione um título consistente com o título do conteúdo;
- Recomendamos que na primeira linha deve ter no máximo 4 palavras;
- Para descrever com detalhes, usar a descrição do commit;
- Usar um emoji no início da mensagem de commit representando sobre o commit;
- Um link precisa ser adicionado em sua forma mais autêntica, ou seja: sem encurtadores de link e links afiliados;

## 💻 Exemplo
```bash
git commit -m ":tada: Meu primeiro commit"
```

## 💈 Padrões de emojis

<table>
  <thead>
    <tr>
      <th>Tipo de commit</th>
      <th>Emojis</th>
    </tr>
  </thead>
 <tbody>
    <tr>
      <td>Commit inicial</td>
      <td> 🎉 <code>:tada:</code>   </td>
    </tr>
    <tr>
      <td> Tag de versão  </td>
      <td> 🔖 <code>:bookmark:</code>   </td>
    </tr>
    <tr>
      <td>  Novo recurso   </td>
      <td> ✨ <code>:sparkles:</code>   </td>
    </tr>
    <tr>
      <td>  Lista de ideias (tasks)    </td>
      <td> 🔜 <code> :soon: </code>   </td>
    </tr>
    <tr>
      <td>  Bugfix  </td>
      <td> 🐛 <code>:bug:</code>   </td>
    </tr>
    <tr>
      <td>  Documentação  </td>
      <td> 📚 <code>:books:</code>   </td>
    </tr>
    <tr>
      <td>  Testes  </td>
      <td> 🧪 <code>:test_tube: </code>   </td>
    </tr>
    <tr>
      <td>Adicionando um teste</td>
      <td> ✅ <code> :white_check_mark: </code>   </td>
    </tr>
    <tr>
      <td> Teste de aprovação </td>
      <td> ✔️ <code> :heavy_check_mark: </code>   </td>
    </tr>
    <tr>
      <td>  Acessibilidade    </td>
      <td> ♿ <code> :wheelchair: </code>   </td>
    </tr>
    <tr>
      <td>  Texto     </td>
      <td> 📝 <code> :pencil: </code>   </td>
    </tr>
    <tr>
      <td>  Package.json em JS      </td>
      <td> 📦 <code> :package: </code>   </td>
    </tr>
    <tr>
      <td>  Em progresso        </td>
      <td> 🚧 <code> :construction: </code>   </td>
    </tr>
    <tr>
      <td>   Arquivos de configuração        </td>
      <td> 🔧 <code> :wrench: </code>   </td>
    </tr>
    <tr>
      <td>   Removendo uma dependência        </td>
      <td> ➖ <code> :heavy_minus_sign: </code>   </td>
    </tr>
    <tr>
      <td>   Adicionando uma dependência        </td>
      <td> ➕ <code> :heavy_plus_sign: </code>   </td>
    </tr>
    <tr>
      <td>   Revertendo mudanças         </td>
      <td> 💥 <code> :boom: </code>   </td>
    </tr>
    <tr>
      <td>   Alterações de revisão de código        </td>
      <td> 👌 <code> :ok_hand: </code>   </td>
    </tr>
   <tr>
      <td>   Refatoração        </td>
      <td> ♻️ <code> :recycle: </code>   </td>
   </tr>
    <tr>
      <td>   Mover/Renomear        </td>
      <td> 🚚 <code> :truck: </code>   </td>
    </tr>
  </tbody>
</table>

<br>[⬆ Voltar ao top](#padrões-de-commits-) <br>
