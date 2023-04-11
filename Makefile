
# tex compiler
TEXBUILD=pdflatex
TEXFLAGS=-file-line-error -synctex=1

# bib compiler
BIBBUILD=bibtex

# name of main tex-file
MAIN=main

TEXDEPS=TexFiles/*.tex papers/*/*.tex
# exra .tex dependencies
$(MAIN).pdf: $(MAIN).tex $(TEXDEPS)
	$(TEXBUILD) $(TEXFLAGS) $(MAIN).tex
	$(BIBBUILD) $(MAIN).aux
	$(TEXBUILD) $(TEXFLAGS) $(MAIN).tex
	$(TEXBUILD) $(TEXFLAGS) $(MAIN).tex

clean:
	rm *.log *.gz *.xml *.blg *.aux *.toc *.pdf *-blx.bib *.bbl TexFiles/*.aux