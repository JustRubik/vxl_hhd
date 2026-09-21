FILE :=
CSS :=

.PHONY: all pandoc

all:
	@echo "Add arguments, please"

pd:
	# pandoc $(FILE) --metadata-file=pandoc.yaml --pdf-engine=lualatex -o $(FILE).pdf
	pandoc $(FILE) --metadata-file=pandoc.yaml --css=style.css --standalone -o $(FILE).html
	weasyprint $(FILE).html $(FILE).pdf
