#
# aliases.bash
#
# bash aliases go in here
#


alias "mv"="mv -i"
alias "cp"="cp -i"
alias "rm"="rm -i"

# Here, we handle OS-specific oddities...
#
SYSTYPE=`uname -s`
case $SYSTYPE in

	# Linux aliases
	#
	Linux )
	if [ "$TERM" != "dumb" ]; then
		eval "`dircolors -b`"
	fi
	alias "ls"="ls -Fh --color=auto"
	alias "grep"="grep --color=auto"
	alias "mv"="mv -iv"
	alias "cp"="cp -iv"
	alias "rm"="rm -iv"
	;;

	# BSD and Darwin aliases
	#
	*BSD|Darwin )
	alias "ls"="ls -FhG"
	alias "mv"="mv -iv"
	alias "cp"="cp -iv"
	alias "rm"="rm -iv"
	;;

	# SunOS aliases
	#
	SunOS )
	alias "ls"="ls -Fh"
	;;

	# All other OSs aliases
	#
	* )
	alias "ls"="ls -Fh"
	;;
esac


alias "vim"="vim -X"
alias "l"="ls -l"
alias "ll"="l -a"
alias "lld"="ll | grep ^d"
alias "lx"="ll -X"
alias "cd.."="cd .."
alias "df"="df -h"
alias "du"="du -h"
alias "j"="jobs"
alias "psg"="ps aux | grep"
alias "llg"="ll | grep"
alias "srcb"="source ~/.bashrc"

# Convert all mpg files into avi files using h264 codec
#
alias "convertvids"="find . -iname \"*.mpg\" -exec mencoder -profile h264 -o {}.avi {} \;"
alias "convertvidsAVI"="find . -name \"*.AVI\" -exec mencoder -profile h264 -o {}.avi {} \;"

# Split single-file FLAC/APEs into multiple files
#
alias "splitflac"="cuebreakpoints --input-format cue --append-gaps *.cue | shntool split -o flac *.flac"
alias "splitape2flac"="cuebreakpoints --input-format cue --append-gaps *.cue | shntool split -o flac *.ape"

# Fix file permissions on files and folders
#
alias "fixperms"="find . \( -type d ! -perm 755 -ok chmod --verbose 755 {} \; \) , \( -type f ! -name .directory ! -name .DS_Store ! -perm 644 -ok chmod --verbose 644 {} \; \)"
