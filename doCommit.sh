#!/bin/bash
set -e

#make sure the PDF has been created
pdflatex Resume.tex > /dev/null
echo "Resume.pdf created..."

#create our PNG image
pdftoppm -f 1 -singlefile -png Resume.pdf Resume
echo "Resume.png created..."

#create our TXT file
pdftotext Resume.pdf Resume.txt
echo "Resume.txt created..."

#add the new files to the repo
git add Resume.tex Resume.pdf Resume.png Resume.txt README.md doCommit.sh
git commit -m "Updated Resume Files"

#push local copy to github
git push -u origin master
