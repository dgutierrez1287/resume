.DEFAULT_GOAL := help
SHELL := /usr/bin/env bash

build: clean
	exec docker run --rm -i --user="1000:1000" --net=none -v "${PWD}":/data "blang/latex:ubuntu" "pdflatex" "resume.tex"
	exec docker run --rm -i --user="1000:1000" --net=none -v "${PWD}":/data "blang/latex:ubuntu" "pdflatex" "references.tex"

clean:
	rm resume.aux && rm resume.log && rm resume.pdf && \
	rm references.aux && rm references.log && rm references.pdf

