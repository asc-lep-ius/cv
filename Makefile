.PHONY: en watch clean png

en:
	typst compile cv.typ output/cv-en.pdf

watch:
	typst watch cv.typ output/cv-en.pdf

png:
	typst compile cv.typ "output/preview-{p}.png" --format png --ppi 150

clean:
	rm -f output/*.pdf output/*.png
