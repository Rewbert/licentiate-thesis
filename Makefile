
# tex compiler
TEXBUILD=pdflatex
TEXFLAGS=-file-line-error -synctex=1

# bib compiler
BIBBUILD=bibtex

# name of main tex-file
MAIN=main
INLAGA=inlaga
SCORIADIVIDER=coloredpagebeforescoria
HASTEEDIVIDER=coloredpagebeforehastee

TEXDEPS=TexFiles/*.tex papers/*/*.tex *.tex
# exra .tex dependencies
$(MAIN).pdf: $(MAIN).tex $(TEXDEPS)
	$(TEXBUILD) $(TEXFLAG) $(SCORIADIVIDER).tex
	$(TEXBUILD) $(TEXFLAG) $(HASTEEDIVIDER).tex
	$(TEXBUILD) $(TEXFLAGS) $(MAIN).tex
	$(BIBBUILD) $(MAIN).aux
	$(TEXBUILD) $(TEXFLAGS) $(MAIN).tex
	$(TEXBUILD) $(TEXFLAGS) $(MAIN).tex

$(INLAGA).pdf: $(INLAGA).tex $(TEXDEPS)
	$(TEXBUILD) $(TEXFLAG) $(INLAGA).tex

clean:
	rm *.log *.gz *.xml *.blg *.aux *.toc *.pdf *-blx.bib *.bbl TexFiles/*.aux