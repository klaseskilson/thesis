# Use Bash shell expansion
SHELL=/bin/bash
#The program that you use for viewing pdf files
PDFVIEWER = ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/LaTeXTools/skim/displayfile -r
# Change name of this if you change the name of demo_student_thesis.tex, should be name of the main tex file
TEXMAINFILE = thesis.tex
# Name that you would like for your resulting pdf file, without extension.
# Defaults to $(TEXMAINFILE) with .pdf as extension
PDFNAME = $(shell basename -s.tex $(TEXMAINFILE))
#Location of latexmk binary
MKLATEX = latexmk
#Options to latexmk, should need to be changed
MKLATEXOPTS = -pdf -pdflatex="xelatex -interaction=nonstopmode" -use-make

# demos: demo_student_thesis.tex demo_lith_lic.tex demo_lith_phd.tex demo_filfak_lic.tex demo_filfak_phd.tex demo_exhibitpage_filfak.tex demo_exhibitpage_lith.tex
# 	$(MKLATEX) $(MKLATEXOPTS) $?
# 	mv demo*.pdf demo/

all: view

$(PDFNAME).pdf: $(TEXMAINFILE) *.tex
	$(MKLATEX) $(MKLATEXOPTS) $<

view: $(PDFNAME).pdf
	$(PDFVIEWER) $(PDFNAME).pdf

clean:
	$(MKLATEX) -CA
	rm -f $(PDFNAME).pdf *.{aux,bbl,bcf,blg,cb,fdb_latexmk,fls,lof,log,lot,out,run.xml,rel,synctex.gz,toc}
