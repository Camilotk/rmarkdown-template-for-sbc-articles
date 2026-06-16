.DEFAULT_GOAL := help

MAIN := article
IMAGE := sbc-rmarkdown:latest
OUT_DIR := out
PDF := $(OUT_DIR)/$(MAIN).pdf
RMD := $(MAIN).Rmd
LATEX_DEPS := references.bib sbc.bst style/sbc-template.sty style/template.tex
ASSET_DEPS := $(wildcard assets/*)

.PHONY: help all install install-local install-ubuntu docker-build build render clean distclean

all: build

help:
	@printf "Comandos disponiveis:\n"
	@printf "  make install        # instala o ambiente de compilacao via Docker\n"
	@printf "  make install-ubuntu # instala dependencias locais no Ubuntu\n"
	@printf "  make install-local  # instala o pacote R rmarkdown no ambiente local\n"
	@printf "  make build          # gera todos os artefatos em out/\n"
	@printf "  make render         # alias para build\n"
	@printf "  make clean          # remove a pasta out/\n"
	@printf "  make distclean      # alias para clean\n"

install: docker-build

install-ubuntu:
	sudo apt-get update
	sudo apt-get install -y \
		r-base \
		r-base-dev \
		pandoc \
		libcurl4-openssl-dev \
		libfontconfig1-dev \
		libfreetype6-dev \
		libfribidi-dev \
		libgit2-dev \
		libharfbuzz-dev \
		libjpeg-dev \
		libpng-dev \
		libssl-dev \
		libtiff5-dev \
		libuv1-dev \
		libxml2-dev \
		libcairo2-dev \
		zlib1g-dev \
		lmodern \
		texlive-latex-base \
		texlive-latex-extra \
		texlive-fonts-recommended \
		texlive-fonts-extra \
		texlive-plain-generic \
		texlive-science \
		texlive-bibtex-extra \
		texlive-lang-portuguese
	$(MAKE) install-local

install-local:
	Rscript -e "if (!requireNamespace('rmarkdown', quietly=TRUE)) install.packages('rmarkdown', repos='https://cloud.r-project.org')"

docker-build:
	docker build -t $(IMAGE) .

build: $(PDF)

render: build

$(PDF): $(RMD) $(LATEX_DEPS) $(ASSET_DEPS)
	mkdir -p $(OUT_DIR)
	docker run --rm --user "$$(id -u):$$(id -g)" -v "$$(pwd):/work" -w /work $(IMAGE) $(RMD)

clean:
	rm -f $(MAIN).pdf $(MAIN).tex $(MAIN).knit.md $(MAIN).aux $(MAIN).bbl $(MAIN).blg \
	      $(MAIN).fdb_latexmk $(MAIN).fls $(MAIN).log $(MAIN).out $(MAIN).synctex.gz \
	      $(MAIN).toc
	rm -rf $(OUT_DIR)

distclean: clean
