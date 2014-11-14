#!/bin/bash
#elaborado por sinfallas
git pull
git log --decorate > changelog
git add .
git commit -a -m "* changelog"
git push --all
exit 0
