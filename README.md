# Template R Markdown Para Artigos No Estilo SBC

Este repositório é um template para quem quer começar um artigo acadêmico em **R Markdown** e gerar PDF com o **estilo LaTeX da SBC (Sociedade Brasileira de Computação)**.

Se você está procurando um **template R Markdown para artigos da SBC**, um **GitHub template para artigos acadêmicos em R Markdown**, ou uma base para escrever artigos no formato da **Sociedade Brasileira de Computação**, este projeto foi feito exatamente para esse uso.

## Importante

**Este não é um template oficial da SBC.**

Ele foi montado para facilitar o uso do estilo da SBC em um projeto moderno com R Markdown, `make` e Docker. Antes de submeter um artigo, vale conferir as instru\c{c}\~oes do evento e comparar com a vers\~ao oficial do template distribu\'ida pela SBC ou pela confer\^encia.

## O Que Este Template Entrega

Com este reposit\'orio, voc\^e j\'a come\c{c}a com:

- um arquivo principal em R Markdown: `article.Rmd`
- um arquivo de refer\^encias BibTeX: `references.bib`
- os arquivos de estilo da SBC necess\'arios para a compila\c{c}\~ao
- um `Makefile` para instalar, compilar e limpar a sa\'ida
- um fluxo com Docker para compilar de forma reproduz\'ivel
- uma estrutura adequada para uso como **template de reposit\'orio no GitHub**

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

Arquivos e diret\'orios mais importantes:

- `article.Rmd`: onde voc\^e escreve o artigo
- `references.bib`: onde voc\^e mant\'em as refer\^encias
- `style/`: arquivos de estilo da SBC usados na compila\c{c}\~ao
- `assets/`: imagens de exemplo
- `out/`: toda a sa\'ida gerada pelo processo de build

## Como Usar

Se voc\^e criou um reposit\'orio novo a partir deste template, o fluxo normal \`e:

1. editar `article.Rmd`
2. atualizar `references.bib`
3. trocar ou remover os arquivos de exemplo em `assets/`
4. compilar o PDF

## Compila\c{c}\~ao Com Docker

Esse \`e o caminho mais simples e mais reproduz\'ivel.

Para preparar o ambiente:

```bash
make install
```

Para compilar:

```bash
make build
```

Todos os arquivos gerados v\~ao para `out/`. Isso inclui o PDF final e tamb\'em os arquivos intermedi\'arios produzidos no processo.

O PDF final fica em:

```text
out/article.pdf
```

Se quiser ver os comandos dispon\'iveis no `Makefile`:

```bash
make help
```

## Compila\c{c}\~ao Local

Se voc\^e preferir compilar sem Docker, vai precisar ter no sistema:

- R
- o pacote `rmarkdown`
- Pandoc
- uma distribui\c{c}\~ao LaTeX com `pdflatex`

O comando b\'asico de renderiza\c{c}\~ao \`e:

```r
rmarkdown::render("article.Rmd")
```

Se quiser instalar apenas a depend\^encia de R usada pelo template:

```bash
make install-local
```

Observa\c{c}\~ao: dependendo de como o seu ambiente local estiver configurado, talvez seja necess\'ario ajustar vari\'aveis como `TEXINPUTS` para que o LaTeX encontre `style/sbc-template.sty`.

## Limpeza

Para apagar tudo o que foi gerado na compila\c{c}\~ao:

```bash
make clean
```

O comando abaixo faz a mesma coisa:

```bash
make distclean
```

## Sobre A Pasta `out`

Tudo o que for sa\'ida de compila\c{c}\~ao deve ficar em `out/`.

Isso vale para:

- PDF final
- arquivos `.tex`
- arquivos `.knit.md`
- logs
- quaisquer outros artefatos intermedi\'arios preservados pelo processo de build

A ideia \`e manter a raiz do projeto limpa, com apenas os arquivos-fonte e a estrutura do template.

## Observa\c{c}\~oes Finais

- O artigo \`e escrito em **R Markdown**, mas a formata\c{c}\~ao final continua baseada no estilo LaTeX da SBC.
- O diret\'orio `style/` normalmente n\~ao precisa ser alterado.
- O diret\'orio `assets/` existe s\'o como exemplo inicial.
- Se o seu shell tiver autocomplete para `make`, os comandos podem ser completados com `Tab`.
