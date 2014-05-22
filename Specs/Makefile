TEX = latex
DVI2PDF = dvipdfm
BIB = bibtex
DOT = 
TOP := $(lastword $(subst /, , $(shell pwd)))
NETDRIVE := $(HOME)/Google\ Drive


LOGS = *.bbl *.blg *.aux *.log *.out
TEXFILE ?= paper

ifeq ($(shell uname -s),Linux)
   #VIEWER = xpdf
	VIEWER = evince
	#VIEWER = acroread
endif
ifeq ($(shell uname -s),Darwin)
   VIEWER = open
endif

.PHONY: all
all:
	$(MAKE) pdf


pdf: $(TEXFILE).tex
	$(TEX) $(TEXFILE)
#	$(BIB) $(TEXFILE)
	$(TEX) $(TEXFILE)
	$(TEX) $(TEXFILE)
	$(DVI2PDF) $(TEXFILE).dvi
	if [ -e $(NETDRIVE) ] ; then \
		if [ -e $(NETDRIVE)/$(TOP) ] ; then \
			cp $(TEXFILE).pdf $(NETDRIVE)/$(TOP)/ ; \
		else \
			mkdir $(NETDRIVE)/$(TOP) ; \
			cp $(TEXFILE).pdf $(NETDRIVE)/$(TOP)/ ; \
		fi; \
	fi;

view: $(TEXFILE).pdf
	$(VIEWER) $(TEXFILE).pdf&


images: $(addsuffix .dot, $(DOT))
	$(MAKE) $(EPS)

%.eps: %.dot
	cat $< | sed 's/APPSHAPE/$(APPSHAPE)/g' | sed 's/FLOWSHAPE/$(FLOWSHAPE)/g' | sed 's/FONT/$(FONT)/g' | dot -Teps -o$@

.PHONY: clean
clean:
	if [ -e .git ] ; then \
		git rm -rf --ignore-unmatch $(LOGS) $(TEXFILE).pdf $(EPS) $(GENIMGS); \
		rm -rf $(LOGS) $(TEXFILE).dvi $(TEXFILE).pdf $(EPS) $(GENIMGS); \
	else \
		rm -rf $(LOGS) $(TEXFILE).dvi $(TEXFILE).pdf $(EPS) $(GENIMGS); \
	fi;

