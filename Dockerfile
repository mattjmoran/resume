# syntax=docker/dockerfile:1
FROM texlive/texlive:latest

WORKDIR /vol
ENTRYPOINT ["sh", "-c", "latexmk -xelatex -interaction=nonstopmode -halt-on-error \"$1\"", "--"]
