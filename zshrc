alias "mv"="mv -i"
alias "cp"="cp -i"
alias "rm"="rm -i"

alias "ls"="ls -FhG"
alias "l"="ls -l"
alias "ll"="l -a"
alias "llg"="ll | grep"
alias "lld"="ll | grep ^d"

alias "df"="df -h"
alias "du"="du -h"
alias "psg"="ps aux | grep"

path+=~/bin
path+=~/.gem/ruby/2.6.0/bin
export PATH

export EDITOR=nvim

if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
	autoload -Uz compinit
	compinit
fi
