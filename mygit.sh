#!/bin/bash
case "$1" in
	up)
		git add .
		git commit -a
		git push --all
		;;	

	change)
		git log --decorate > changelog
		git add .
		git commit -a -m "* changelog"
		git push --all
		;;

	change-all)
		for i in $(find . -maxdepth 1 -type d); do
			git log --decorate > changelog
			git add .
			git commit -a -m "* changelog"
			git push --all    		
		done
		;;

	refresh)
		for i in $(find . -maxdepth 1 -type d); do
    			git pull
		done
		;;

	*)
		echo "USO: $0 {up|change|change-all|refresh}"
		exit 0
		;;

esac
exit 0
