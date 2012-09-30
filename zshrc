# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fishy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(screen git zsh-syntax-highlighting)

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh

## ZSH Options
setopt menu_complete
unsetopt correct_all

## Variables
export TERM='xterm-256color'
export EDITOR='vim'
export LESS='-I -R'

## Custom Aliases
alias ls='ls --color'
alias R='R --vanilla --silent'

## SSH
alias ted='ssh zqureshi@teddie.socis.ca'
alias -g cdf='ssh g0zee@greywolf.cdf.toronto.edu'
alias cslab='ssh g0zee-cdf@wifi.cs.toronto.edu'
