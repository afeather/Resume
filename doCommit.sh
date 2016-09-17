#!/bin/bash

#make sure the PDF has been created
pdflatex Resume.tex

#create our PNG image
pdftoppm -f 1 -singlefile -png Resume.pdf Resume

#add the new files to the repo
git add Resume.tex Resume.pdf Resume.png README.md doCommit.sh
git commit -m "Updated Resume Files"

#push local copy to github
git push -u origin master
