FONT_DIR := fonts
OUTPUT_DIR := output

.PHONY: all en en-1page watch watch-1page clean png push

all: en en-1page png

$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

en: | $(OUTPUT_DIR)
	typst compile --font-path $(FONT_DIR) cv.typ $(OUTPUT_DIR)/cv-en.pdf

en-1page: | $(OUTPUT_DIR)
	typst compile --font-path $(FONT_DIR) --input compact=true cv.typ $(OUTPUT_DIR)/cv-en-1page.pdf

watch:
	typst watch --font-path $(FONT_DIR) cv.typ $(OUTPUT_DIR)/cv-en.pdf

watch-1page:
	typst watch --font-path $(FONT_DIR) --input compact=true cv.typ $(OUTPUT_DIR)/cv-en-1page.pdf

png: | $(OUTPUT_DIR)
	typst compile --font-path $(FONT_DIR) cv.typ "$(OUTPUT_DIR)/preview-{p}.png" --format png --ppi 150

clean:
	rm -f $(OUTPUT_DIR)/*.pdf $(OUTPUT_DIR)/*.png

push:
	@COMMIT_COUNT=$$(git rev-list --count HEAD); \
	if [ "$$COMMIT_COUNT" -gt 1 ]; then \
		ROOT=$$(git rev-list --max-parents=0 HEAD); \
		git reset --soft "$$ROOT"; \
		git commit --amend -m "docs: CV" --reset-author --no-verify; \
		echo "squashed $$COMMIT_COUNT commits into one"; \
	fi
	git push github main --force || true
	git push gitlab main --force
