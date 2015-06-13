
HTML_FILES := $(patsubst %.Rmd, %.html ,$(wildcard *.Rmd)) \
              $(patsubst %.md, %.html ,$(wildcard *.md))

all: html


html: $(HTML_FILES)

%.html: %.Rmd
	Rscript compile.R "$<"

%.html: %.md
	Rscript compile.R "$<"

.PHONY: clean
clean:
	$(RM) -r $(HTML_FILES) libs

