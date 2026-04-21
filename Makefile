FONT_DIR := fonts
OUTPUT_DIR := output

.PHONY: all software-full software-onepage ai-engineer-full ai-engineer-onepage watch-software-full watch-software-onepage watch-ai-engineer-full watch-ai-engineer-onepage clean png push

all: software-full software-onepage ai-engineer-full ai-engineer-onepage png

$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

software-full: | $(OUTPUT_DIR)
	typst compile --font-path $(FONT_DIR) cv.typ $(OUTPUT_DIR)/cv-software-full.pdf

software-onepage: | $(OUTPUT_DIR)
	typst compile --font-path $(FONT_DIR) --input compact=true cv.typ $(OUTPUT_DIR)/cv-software-onepage.pdf

ai-engineer-full: | $(OUTPUT_DIR)
	typst compile --font-path $(FONT_DIR) --input ai=true --input dense=true cv.typ $(OUTPUT_DIR)/cv-ai-engineer-full.pdf

ai-engineer-onepage: | $(OUTPUT_DIR)
	typst compile --font-path $(FONT_DIR) --input ai=true --input compact=true cv.typ $(OUTPUT_DIR)/cv-ai-engineer-onepage.pdf

watch-software-full:
	typst watch --font-path $(FONT_DIR) cv.typ $(OUTPUT_DIR)/cv-software-full.pdf

watch-software-onepage:
	typst watch --font-path $(FONT_DIR) --input compact=true cv.typ $(OUTPUT_DIR)/cv-software-onepage.pdf

watch-ai-engineer-full:
	typst watch --font-path $(FONT_DIR) --input ai=true --input dense=true cv.typ $(OUTPUT_DIR)/cv-ai-engineer-full.pdf

watch-ai-engineer-onepage:
	typst watch --font-path $(FONT_DIR) --input ai=true --input compact=true cv.typ $(OUTPUT_DIR)/cv-ai-engineer-onepage.pdf

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
