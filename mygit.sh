#!/bin/bash
case "$1" in
	up)
		git add .
		git commit -a
		git push --all
		echo "Finalizado..."
		;;

	up-all)
		for i in $(find . -maxdepth 1 -type d | cut -c 3-50); do
			cd $i
			echo $(pwd)
			git add .
			git commit -a -m $2
			git push --all
			cd ..
		done
		echo "Finalizado..."
		;;

	change)
		git log --decorate > changelog
		git add .
		git commit -a -m "* changelog"
		git push --all
		echo "Finalizado..."
		;;

	change-all)
		for i in $(find . -maxdepth 1 -type d | cut -c 3-50); do
			cd $i
			echo $(pwd)
			git log --decorate > changelog
			git add .
			git commit -a -m "* changelog"
			git push --all
			cd ..
		done
		echo "Finalizado..."
		;;

	refresh)
		for i in $(find . -maxdepth 1 -type d | cut -c 3-50); do
    			cd $i
			echo $(pwd)
			git pull
			cd ..
		done
		echo "Finalizado..."
		;;

	*)
		echo "USO: $0 {up|change|change-all|refresh|up-all <message>}"
		;;
esac
exit 0
