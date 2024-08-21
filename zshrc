alias "mv"="mv -i"
alias "cp"="cp -i"
alias "rm"="rm -i"

alias "ls"="ls -FhG"
alias "l"="ls -l"
alias "ll"="l -a"
alias "llg"="ll | grep"
alias "lld"="ll | grep ^d"

alias "erd"="erd --human"
alias "es"="erd --level 1 --sort name --layout inverted"
alias "el"="es --long"
alias "ell"="el --hidden"

alias "df"="df -h"
alias "du"="du -h"
alias "psg"="ps aux | grep"

alias "git-move-diff"="git rev-parse --abbrev-ref HEAD | git show --color-moved-ws=ignore-all-space -w --patch-with-stat --color-moved"

export EDITOR=nvim
