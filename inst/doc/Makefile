

pdfall: rotateFiles Causata-vignette.pdf

rotateFiles: 
  cp -F Causata-vignette/Causata-vignette-fake.rnw Causata-vignette.rnw

setvars:
RPROG=  $(R_HOME)/bin/R
RSCRIPT=$(R_HOME)/bin/Rscript

Causata-vignette.pdf: Causata-vignette.rnw
  $(RPROG) CMD Sweave Causata-vignette.rnw
	$(RSCRIPT) --vanilla -e "tools::texi2dvi( 'Causata-vignette.tex', pdf = TRUE, clean = TRUE ) "
	rm -fr Causata-vignette.tex