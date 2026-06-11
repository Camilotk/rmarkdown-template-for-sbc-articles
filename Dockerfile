FROM rocker/r-ver:4.3.3

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Etc/UTC
WORKDIR /work

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    make \
    lmodern \
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
    texlive-latex-base \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-plain-generic \
    texlive-science \
    texlive-bibtex-extra \
    texlive-lang-portuguese \
 && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled rmarkdown

COPY docker/render-rmd /usr/local/bin/render-rmd
RUN chmod +x /usr/local/bin/render-rmd

ENTRYPOINT ["render-rmd"]
CMD ["article.Rmd"]
