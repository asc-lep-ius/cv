FONT_DIR := fonts

.PHONY: en watch clean png

en:
	typst compile --font-path $(FONT_DIR) cv.typ output/cv-en.pdf

watch:
	typst watch --font-path $(FONT_DIR) cv.typ output/cv-en.pdf

png:
	typst compile --font-path $(FONT_DIR) cv.typ "output/preview-{p}.png" --format png --ppi 150

clean:
	rm -f output/*.pdf output/*.png
