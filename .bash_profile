#
# There are 3 different types of shells in bash:
#    a login shell,
#    a normal shell,
#    and an interactive shell.
# Login shells read ~/.profile and interactive shells read ~/.bashrc
#

#
# .bash_profile
#   - sourced for login shells
#


# Source the .bashrc file
#
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

