# Template R Markdown Para Artigos No Estilo SBC

Este repositório é um template para quem quer começar um artigo acadêmico em **R Markdown** e gerar PDF com o **estilo LaTeX da SBC (Sociedade Brasileira de Computação)**.

Se você está procurando um **template R Markdown para artigos da SBC**, um **GitHub template para artigos acadêmicos em R Markdown**, ou uma base para escrever artigos no formato da **Sociedade Brasileira de Computação**, este projeto foi feito exatamente para esse uso.

## Importante

**Este não é um template oficial da SBC.**

Ele foi montado para facilitar o uso do estilo da SBC em um projeto moderno com R Markdown, `make` e Docker. Antes de submeter um artigo, vale conferir as instruções do evento e comparar com a versão oficial do template distribuída pela SBC ou pela conferência.

## O Que Este Template Entrega

Com este repositório, você já começa com:

- um arquivo principal em R Markdown: `article.Rmd`
- um arquivo de referências BibTeX: `references.bib`
- os arquivos de estilo da SBC necessários para a compilação
- um `Makefile` para instalar, compilar e limpar a saída
- um fluxo com Docker para compilar de forma reproduzível
- uma estrutura adequada para uso como **template de repositório no GitHub**

## Estrutura Do Projeto

```text
.
|-- article.Rmd
|-- references.bib
|-- sbc.bst
|-- style/
|   `-- sbc-template.sty
|-- assets/
|   |-- fig1.jpg
|   |-- fig2.jpg
|   `-- table.jpg
|-- docker/
|   `-- render-rmd
|-- Dockerfile
|-- Makefile
|-- out/
`-- README.md
```

Arquivos e diretórios mais importantes:

- `article.Rmd`: onde você escreve o artigo
- `references.bib`: onde você mantém as referências
- `style/`: arquivos de estilo da SBC usados na compilação
- `assets/`: imagens de exemplo
- `out/`: toda a saída gerada pelo processo de build

## Como Usar

Para usar este template no GitHub e começar um artigo novo, siga este fluxo:

1. No GitHub, clique em `Use this template`.
Depois, escolha `Create new repository` para gerar um repositório novo a partir deste template.

2. Clone o repositório criado na sua máquina.
Se quiser trabalhar localmente, faça o clone normal com Git e abra a pasta do projeto no seu editor.

3. Edite o arquivo `article.Rmd`.
O texto principal do artigo, as seções, as figuras geradas em R e as tabelas em Markdown ficam nesse arquivo.

4. Atualize o arquivo `references.bib`.
Coloque nele todas as referências bibliográficas do artigo em formato BibTeX.

5. Revise a pasta `assets/`.
Substitua as imagens de exemplo pelos seus próprios arquivos ou remova o que não for usar.

6. Compile o projeto.
O caminho recomendado é usar Docker com `make install` e depois `make build`.

7. Verifique o resultado em `out/article.pdf`.
Esse é o PDF final gerado a partir do template.

Resumo prático dos arquivos que você normalmente vai editar:

- `article.Rmd`: conteúdo do artigo
- `references.bib`: referências bibliográficas
- `assets/`: imagens e arquivos visuais usados no texto

Arquivos que normalmente você não precisa editar:

- `style/`: arquivos de estilo da SBC
- `docker/`: suporte à compilação com Docker
- `Dockerfile`: imagem de build
- `Makefile`: comandos prontos para compilar e limpar

## Compilação Com Docker

Esse é o caminho mais simples e mais reproduzível.

Para preparar o ambiente:

```bash
make install
```

Para compilar:

```bash
make build
```

Todos os arquivos gerados vão para `out/`. Isso inclui o PDF final e também os arquivos intermediários produzidos no processo.

O PDF final fica em:

```text
out/article.pdf
```

Se quiser ver os comandos disponíveis no `Makefile`:

```bash
make help
```

## Compilação Local

Se você preferir compilar sem Docker, vai precisar ter no sistema:

- R
- o pacote `rmarkdown`
- Pandoc
- uma distribuição LaTeX com `pdflatex`

O comando básico de renderização é:

```r
rmarkdown::render("article.Rmd")
```

Se quiser instalar apenas a dependência de R usada pelo template:

```bash
make install-local
```

Observação: dependendo de como o seu ambiente local estiver configurado, talvez seja necessário ajustar variáveis como `TEXINPUTS` para que o LaTeX encontre `style/sbc-template.sty`.

## Limpeza

Para apagar tudo o que foi gerado na compilação:

```bash
make clean
```

O comando abaixo faz a mesma coisa:

```bash
make distclean
```

## Sobre A Pasta `out`

Tudo o que for saída de compilação deve ficar em `out/`.

Isso vale para:

- PDF final
- arquivos `.tex`
- arquivos `.knit.md`
- logs
- quaisquer outros artefatos intermediários preservados pelo processo de build

A ideia é manter a raiz do projeto limpa, com apenas os arquivos-fonte e a estrutura do template.

## Observações Finais

- O artigo é escrito em **R Markdown**, mas a formatação final continua baseada no estilo LaTeX da SBC.
- O diretório `style/` normalmente não precisa ser alterado.
- O diretório `assets/` existe só como exemplo inicial.
- Se o seu shell tiver autocomplete para `make`, os comandos podem ser completados com `Tab`.
