PREF=2020-NaaktgeborenC+etal-CarnotPrinciple

clean:
	for EXT in log aux blg bbl out toc info; do \
		rm -vf ${PREF}.$$EXT; \
	done

wipe: clean
	rm -vf cc/*pdf

cc/%.pdf: cc/%.svg
	inkscape \
		--file=$< \
		--export-pdf=$@

fig/%.pdf: fig/%.svg
	inkscape \
		--file=$< \
		--export-pdf=$@

${PREF}.pdf: ${PREF}.tex 0*tex \
		cc/by.pdf \
		fig/stirling_engine_alpha_color.pdf \
		fig/stirling_engine_beta_color.pdf \
		fig/stirling_engine_gamma_color.pdf \
		bibfile.bib
	pdflatex --enable-write18 ${PREF}.tex
	bibtex ${PREF}
	pdflatex --enable-write18 ${PREF}.tex
	pdflatex --enable-write18 ${PREF}.tex

