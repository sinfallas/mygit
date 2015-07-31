#!/bin/bash
case "$1" in
	up)
		git add .
		git commit -a
		git push --all
		echo -e "\e[00;1;92mFinished...\e[00m"
		;;

	up-all)
		for i in $(find . -maxdepth 1 -type d | cut -c 3-50); do
			cd $i
			echo -e "\e[00;1;92m$(pwd)\e[00m"
			git add .
			git commit -a -m $2
			git push --all
			cd ..
		done
		echo -e "\e[00;1;92mFinished...\e[00m"
		;;

	change)
		git log --decorate > changelog
		git add .
		git commit -a -m "* changelog"
		git push --all
		echo -e "\e[00;1;92mFinished...\e[00m"
		;;

	change-all)
		for i in $(find . -maxdepth 1 -type d | cut -c 3-50); do
			cd $i
			echo -e "\e[00;1;92m$(pwd)\e[00m"
			git log --decorate > changelog
			git add .
			git commit -a -m "* changelog"
			git push --all
			cd ..
		done
		echo -e "\e[00;1;92mFinished...\e[00m"
		;;

	refresh)
		for i in $(find . -maxdepth 1 -type d | cut -c 3-50); do
    			cd $i
			echo -e "\e[00;1;92m$(pwd)\e[00m"
			git pull
			git checkout
			cd ..
		done
		echo -e "\e[00;1;92mFinished...\e[00m"
		;;

	*)
		echo "usage: $0 {up|change|change-all|refresh|up-all <message>}"
		;;
esac
exit 0
