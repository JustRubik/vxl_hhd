.PHONY: all pandoc

all:
	"Add arguments, please"

pd:
	pandoc README.md --metadata-file=pandoc.yaml --pdf-engine=lualatex -o README.pdf
