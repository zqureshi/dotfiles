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

## Determine System
if [ `uname -s` = 'Darwin' ]; then
  SYSTEM='MAC'
else
  SYSTEM='LINUX'
fi

if [[ "$TERM" != 'screen-256color' ]]; then
  export TERM='xterm-256color'
fi

## Variables
export EDITOR='vim'
export LESS='-I -R'

## Aliases

# General
alias -g ack='ack-grep'
alias pd='pushd'
alias v='vim'

# Git
alias g='git'
alias l='git log'
alias m='git co master'
alias lm='git log master'
alias st='git st'
alias br='git br'
alias co='git co'
alias di='git di'
alias dc='git dc'
alias ci='git ci'
alias add='git add'
alias brv='git br -vv'
alias amend='git commit --amend --no-edit'

# Mac
if [ "$SYSTEM" != 'MAC' ]; then
  alias ls='ls --color'
  alias R='R --vanilla --silent'
else
  # System is a Mac
  # Prefer Homebrew binaries to system
  export PATH="/usr/local/bin:$PATH"

  # Enable CLI Colouring
  export CLICOLOR=1
fi

# Moooo
if [[ -o login ]]; then
  (fortune -s | cowsay | lolcat) 2>/dev/null
fi
