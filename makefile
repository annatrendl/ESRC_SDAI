case_for_support.pdf: case_for_support.tex domesticabuse_refs.bib
	pdflatex case_for_support
	bibtex case_for_support
	pdflatex case_for_support
	pdflatex case_for_support
	pdflatex case_for_support
	pdflatex case_for_support
	pdftk case_for_support.pdf output case_for_support_repaired.pdf
	mv case_for_support_repaired.pdf  case_for_support.pdf

diff.tex: original.tex case_for_support.tex
	latexdiff original.tex case_for_support.tex > diff.tex

diff.pdf: diff.tex refs.bib
	pdflatex diff
	bibtex diff
	pdflatex diff
	pdflatex diff
	pdflatex diff
	pdflatex diff
	pdftk diff.pdf output diff_repaired.pdf
	mv diff_repaired.pdf  diff.pdf	

local_refs.bib: case_for_support.aux refs.bib
	cat refs.bib | aux2bib case_for_support.aux > local_refs.bib

case_for_support.aux: case_for_support.tex refs.bib

make clean:
	rm *.aux *.bbl *.blg *.log *.dvi *.lof *.ttt *.fff *.out *.run.xml *-blx.bib

