AUXX = $(addprefix build/, main.toc main.aux)
SECS := $(wildcard secs/*.tex)

all: ECA.pdf

ECA.pdf: $(AUXX) main.tex $(SECS) mstyle.sty
	cp $(AUXX) .
	pdflatex main.tex
	pdflatex main.tex
	mv *.toc build
	mv *.aux build
	mv *.log build
	mv *.out build
	mv main.pdf ECA.pdf

$(AUXX): main.tex $(SECS)
	pdflatex main.tex
	pdflatex main.tex
	mkdir -p build
	mv *.toc build
	mv *.aux build
	mv *.log build
	mv *.out build
	rm main.pdf

.PHONY: clean
clean:
	rm -rf build
