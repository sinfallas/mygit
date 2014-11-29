#!/bin/bash
case "$1" in
	up)
		git pull
		git add .
		git commit -a
		git push --all
		;;	

	change)
		git pull
		git log --decorate > changelog
		git add .
		git commit -a -m "* changelog"
		git push --all
		;;

	refresh)
		aqui va el refresh
		;;

	*)
		echo "USO: $0 {up|change|refresh}"
		exit 0
		;;
esac
exit 0
