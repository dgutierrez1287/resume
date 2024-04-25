.DEFAULT_GOAL := help
SHELL := /usr/bin/env bash

build: clean
	exec docker run --rm -i --user="1000:1000" --net=none -v "${PWD}":/data "blang/latex:ubuntu" "pdflatex" "resume.tex"
	exec docker run --rm -i --user="1000:1000" --net=none -v "${PWD}":/data "blang/latex:ubuntu" "pdflatex" "references.tex"

clean:
	rm -f resume.aux && rm -f resume.log && rm -f resume.pdf && \
	rm -f references.aux && rm -f references.log && rm -f references.pdf

