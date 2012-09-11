## Prompt
#PS1='[\e[0;32m\]\u@\h \[\e[1;34m\]\W\[\e[0m\]]\$ '

## General
bind '"\t":menu-complete'
shopt -s cdspell
shopt -s nocaseglob

## Variables
export TERM='xterm-256color'
export EDITOR='vim'
export LESS='-I -R'

## Custom Aliases
alias ls='ls --color'
alias R='R --vanilla --silent'

## SSH
alias ted='ssh zqureshi@teddie.socis.ca'
alias cdf='ssh g0zee@greywolf.cdf.toronto.edu'
alias cslab='ssh g0zee-cdf@wifi.cs.toronto.edu'
