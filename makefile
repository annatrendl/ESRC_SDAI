Draft.pdf: Draft.tex domesticabuse_refs.bib
	pdflatex Draft
	bibtex Draft
	pdflatex Draft
	pdflatex Draft
	pdflatex Draft
	pdflatex Draft
	pdftk Draft.pdf output Draft_repaired.pdf
	mv Draft_repaired.pdf  Draft.pdf

diff.tex: original.tex Draft.tex
	latexdiff original.tex Draft.tex > diff.tex

diff.pdf: diff.tex refs.bib
	pdflatex diff
	bibtex diff
	pdflatex diff
	pdflatex diff
	pdflatex diff
	pdflatex diff
	pdftk diff.pdf output diff_repaired.pdf
	mv diff_repaired.pdf  diff.pdf	

local_refs.bib: Draft.aux refs.bib
	cat refs.bib | aux2bib Draft.aux > local_refs.bib

Draft.aux: Draft.tex refs.bib

make clean:
	rm *.aux *.bbl *.blg *.log *.dvi *.lof *.ttt *.fff *.out *.run.xml *-blx.bib

