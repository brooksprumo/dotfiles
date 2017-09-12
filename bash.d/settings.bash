#
# settings.bash
#
# global bash settings go in here
#


#
# Set some default values here
#

# Set the umask to rwxrwxr-x by default
#
umask 002

# don't put duplicate lines in the history. See bash(1) for more options
#
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
#
shopt -s checkwinsize

# If set, Bash includes filenames beginning with a `.' in the results of filename expansion.
#
shopt -s dotglob

# Source the bash completion file(s) if they exist
#
if [ -f /usr/share/bash-completion/bash_completion ]; then
	source /usr/share/bash-completion/bash_completion
else
	if [ -f /etc/bash_completion ]; then
		source /etc/bash_completion
	fi
	if [ -d /etc/bash_completion.d ]; then
		for file in /etc/bash_completion.d/*; do
			if [ -f $file ]; then
				source $file
			fi
		done
	fi
fi


#
# Some helpful information is below
#

# Related bash commands:
#
# env - Display, set, or remove environment variables
# function - Define Function Macros
# local - Create variables
# logname - Print current login name
# set - Manipulate shell variables and functions
# uname - Print system information
# users - Print login names of users currently logged in
# who - Print who is currently logged in
# the default umask is set in /etc/login.defs

# find /your/dir/ -type d -exec chmod 770 {} > /dev/null 2>&1 \;
# find /your/dir/ -type f -exec chmod 660 {} > /dev/null 2>&1 \;
# find ./ -type f -name "*.JPG" -exec rename s/.JPG$/.jpg/ {} \;
# find [directory] -name some-filename -exec [command] {} \;


