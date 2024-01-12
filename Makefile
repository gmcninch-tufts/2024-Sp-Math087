FILTERS = --lua-filter pandoc-proofs.lua --filter pandoc-xnos --filter pandoc-eqnos --filter pandoc-secnos 

MACROS=build-assets/latex-macros.md

CMD=/home/george/.local/bin/course report

META=--metadata-file=build-assets/metadata.yaml
BEAMER_META=--metadata-file=build-assets/beamer-metadata.yaml

PD=pandoc --standalone --from markdown -V linkcolor:red \
    $(MACROS) $(FILTERS) --citeproc $(META)

PD_BEAMER=pandoc --standalone --from markdown --number-sections -V linkcolor:red \
    $(MACROS) $(FILTERS) --citeproc $(BEAMER_META)


YQ=yq -n '[inputs] | add'

CSS_DEFAULT="/home/george/Classes/AY2023-24--2024-sp--math87/assets/default.css"

VPATH = .:pacing:resources:problem-sets:lectures:Exams:practicum:Exam-review


logistics=$(wildcard course-page/*.md)
logistics_pdf=$(logistics:.md=.pdf)


posts = $(wildcard course-posts/*.md)
posts_pdf = $(posts:.md=.pdf)

problems_dirs = problem-sets

all: logistics 

logistics: $(logistics_pdf) 

posts: $(posts_pdf)

MJ=https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-chtml-full.js


# %.html: %.md
# 	$(PD) $(META) $< assets/biblio.md --css=$(CSS_DEFAULT)  --mathjax=$(MJ) --to html  -o $@


%.pdf: %.md
	$(PD) $(META) $< build-assets/biblio.md --pdf-engine=xelatex --resource-path=$(RP) --to pdf -o $@



.PHONY = echoes

echoes:
	@echo Content: $(content_json) $(content_pdf) $(content_md)
	@echo Logistics: $(logistics)

.PHONY = clean

clean: clean_content clean_logistics clean_posts

clean_content:
	-rm -f $(content_json) $(content_pdf)  $(content_md) $(content_tex)

clean_logistics:
	-rm -f $(logistics_html) $(pacing_md) $(logistics_pdf)

clean_posts:
	-rm -f $(posts_slides) $(posts_pdf)  $(posts_html)
