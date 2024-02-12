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

notebooks=$(wildcard course-content/*.ipynb)
notebooks_pdf=$(notebooks:.ipynb=.pdf)

slides=$(wildcard course-content/*.md)
slides_pdf=$(slides:.md=-slides.pdf)

pages_pdf=$(addprefix course-assets/pages-pdf/,$(pages:.md=.pdf))

posts_pdf=$(addprefix course-assets/posts-pdf/,$(posts:.md=.pdf))

problems=$(wildcard course-assignments/*.md)
problems_pdf=$(problems:.md=.pdf)

all: pages posts   notebooks # problems # slides

pages: $(pages_pdf)
posts: $(posts_pdf)
problems: $(problems_pdf)
#slides: $(slides_pdf)

notebooks: $(notebooks_pdf)

%-slides.html: %.md
	$(PD) $(META) $< build-assets/biblio.md --css=$(CSS_DEFAULT) -V slideous-url=$(SLIDEOUS) -t slidy --mathjax=$(MJ)  -o $@

#%.md: %.ipynb
#	$(PDJ) $< --extract-media=course-assets/images -o $@

%-slides.pdf: %.md
	$(PD) $(BEAMER_META) $< --pdf-engine=xelatex -t beamer --incremental --resource-path=$(RP) -o $@


%.pdf: %.ipynb
	jupyter nbconvert --to pdf  $<
#	jupyter nbconvert --to pdf --template=build-assets/secnum.tplx $<

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
