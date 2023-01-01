#!/bin/bash
set -e

# Make sure the PDF has been created.
pdflatex -interaction=nonstopmode Resume.tex && echo "Resume.pdf created..."

# Create our PNG image
pdftoppm -f 1 -singlefile -png Resume.pdf Resume && echo "Resume.png created..."

# Create our TXT file
pdftotext Resume.pdf Resume.txt & echo "Resume.txt created..."

# Add the new files to the repo
git add Resume.tex Resume.pdf Resume.png Resume.txt README.md doCommit.sh
git commit -m "Updated Resume Files"

# Push
git push -u origin master
