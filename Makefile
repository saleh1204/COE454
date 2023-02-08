HTML := esp32_arduino.html

PDF  := esp32_arduino.pdf   
        


all: html pdf

html: $(HTML)
pdf: $(PDF)

HTML_OPTS := -v -a toc=left -a sectnums -a icons=font -a frame=topbot -a grid=rows -a source-highlighter=highlight.js -a highlightjs-theme=atom-one-light -d article -a stem
PDF_OPTS := -v -a toc=left -a sectnums -a icons=font -a frame=topbot -a grid=rows -a source-highlighter=coderay -d article -a stem

%.html: %.adoc
	asciidoctor $(HTML_OPTS) -n -a data-uri $<

%.pdf: %.adoc pdf-theme.yml
	asciidoctor-pdf $(PDF_OPTS) -a pdf-stylesdir=. -a pdf-style=pdf $<

clean:
	rm -f $(HTML) $(PDF)

.PHONY: all clean html pdf
