#-*-mode: makefile -*-

META=--metadata-file=build-assets/metadata.yaml
BEAMER_META=--metadata-file=build-assets/beamer-metadata.yaml

PD=pandoc --standalone --from markdown -V linkcolor:red --citeproc
PDJ=pandoc 

CMD=/home/george/.local/bin/course report

VPATH = .:course-pages:course-posts

CSS_DEFAULT="build-assets/default.css"

posts=$(notdir $(wildcard course-posts/*.md))
pages=$(notdir $(wildcard course-pages/*.md))

notebooks=$(wildcard course-notebooks/*.ipynb)
notebooks_md=$(notebooks:.ipynb=.md)

pages_pdf=$(addprefix course-assets/pages-pdf/,$(pages:.md=.pdf))

posts_pdf=$(addprefix course-assets/posts-pdf/,$(posts:.md=.pdf))

problems=$(wildcard course-assignments/*.md)
problems_pdf=$(problems:.md=.pdf)

all: pages posts problems notebooks

pages: $(pages_pdf)
posts: $(posts_pdf)
problems: $(problems_pdf)
notebooks: $(notebooks_md)

%-slides.html: %.md
	$(PD) $(META) $< build-assets/biblio.md --css=$(CSS_DEFAULT) -V slideous-url=$(SLIDEOUS) -t slidy --mathjax=$(MJ)  -o $@

%.md: %.ipynb
	$(PDJ) $< --extract-media=course-notebooks -o $@

course-assets/pages-pdf/%.pdf course-assets/posts-pdf/%.pdf %.pdf: %.md
	$(PD) $(META) $< build-assets/biblio.md --pdf-engine=xelatex --resource-path=$(RP) -t latex -o $@

.PHONY: echoes

echoes:
	@echo $(pages)
	@echo $(pages_pdf)
	@echo $(posts)
	@echo $(posts_pdf)


.PHONY: clean

clean: clean_pdf clean_html

clean_pdf:
	-rm -f $(notes_pdf)

clean_html:
	-rm -f $(notes_html)
