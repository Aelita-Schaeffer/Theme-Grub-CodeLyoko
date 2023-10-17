#!/bin/bash

set -e
export PREFIX="/boot"

# TODO: ajoute wallpaper modificateur

while [[ "${#}" -gt 0 ]] ; do
	case "${1}" in
		("--"[pP][rR][eE][fF][iI][xX])
			shift
			if [[ -d "${1}" ]] ; then
				export PREFIX="${1}"
				shift
			fi
		;;
		(*)
			shift
		;;
	esac
done

case "${OPT}" in
	("install")
		if [[ -d "${PREFIX}/grub" ]] ; then
			:
		elif [[ -d "${PREFIX}/grub2" ]] ; then
			:
		else
			echo "cannot find the grub directory, please check the location and try with \"bash ${0##*/} --prefix <directory>\"."
			exit 1
		fi
	;;
	(*)
		echo "unknown option, type \"bash ${0##*/} --help\" to get information about installer."
		exit 1
	;;
esac
