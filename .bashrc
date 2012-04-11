#
# There are 3 different types of shells in bash:
#    a login shell,
#    a normal shell,
#    and an interactive shell.
# Login shells read ~/.profile and interactive shells read ~/.bashrc
#

#
# .bashrc
#   - sourced for non-login shells
#


# Path Munge function
#
pathmunge () {
	if ! echo $PATH | grep -q -E  "(^|:)$1($|:)" ; then
		if [ -d $1 ]; then
			if [ "$2" = "after" ]; then
				PATH=$PATH:$1
			else
				PATH=$1:$PATH
			fi
		fi
	fi
}


# Man Path Munge function
#
manpathmunge () {
	if ! echo $MANPATH | grep -q -E  "(^|:)$1($|:)" ; then
		if [ -d $1 ]; then
			if [ "$2" = "after" ]; then
				MANPATH=$MANPATH:$1
			else
				MANPATH=$1:$MANPATH
			fi
		fi
	fi
}


# Source the files in the .bash.d folder
#
if [ -d ~/.bash.d ]; then
	for file in ~/.bash.d/*.bash; do
		if [ -f $file ]; then
			source $file
		fi
	done
fi

