#
# prompt.bash
#
# prompt/title settings go in here
#


#
# Set the prompt here
#

# Set the colors. Special case if we are root
# tip: the \[ and \] are there to allow bash to correctly calculate word wrapping
#
if [ `echo $USER` = "root" ]; then
	color_user="\[\e[0;37;41m\]"
else
	color_user="\[\e[0;37;42m\]"
fi
color_dir="\[\e[0;37;46m\]"
color_host="\[\e[0;37;45m\]"
color_jobs="\[\e[0;37;43m\]"
color_none="\[\e[0m\]"

# set the prompt
#
export PS1="$color_jobs\j$color_none $color_user\u$color_none $color_host\h$color_none $color_dir\w$color_none "

# Set the title to user@host:dir
#
case $TERM in
	*term*|rxvt)
		export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\a"'
esac

