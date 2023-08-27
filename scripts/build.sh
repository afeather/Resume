#!/bin/bash
set -e

# Make sure the PDF has been created.
pdflatex -interaction=nonstopmode Resume.tex && echo "Resume.pdf created..."

# Create our PNG image
convert png:<(pdftoppm -png -f 1 -singlefile Resume.pdf) png:<(pdftoppm -png -f 2 -singlefile Resume.pdf) -append Resume.png && echo "Resume.png created..."

# Create our TXT file
pdftotext Resume.pdf - | perl -pe 's/[^[:ascii:]]//g' > Resume.txt && echo "Resume.txt created..."
