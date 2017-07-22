# Tracing
#PS4=$'%D{%M%S%.} %N:%i> '
#exec 3>&2 2>$HOME/startlog.$$
#set -xo prompt_subst

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
plugins=(screen git zsh-syntax-highlighting zsh-nvm)

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

## Shell Functions

function _tm() {
  if [[ -z "$1" ]]; then
    SESSION="${PWD:t:gs/./-/}"
  else
    SESSION="$1"
  fi

  tmux new -A -s "$SESSION"
}

function _clone() {
  if [[ -z "$1" ]]; then
    echo "Usage: clone shopify_repo"
    return
  fi

  # If string contains a / then
  if [[ "$1" == *"/"* ]]; then
    git clone git@github.com:$1 $2
  else
    git clone git@github.com:Shopify/$1 $2
  fi
}

function _agent() {
  pkill -kill -f 'ssh-agent' && eval "$(ssh-agent -s)"
}

function _pretty_json() {
  if [[ -z "$1" ]]; then
    echo "Usage: j json_file"
    return
  fi

  if [[ "${1:e}" == "gz" ]]; then
    CAT_TOOL='gzcat'
  else
    CAT_TOOL='cat'
  fi

  $CAT_TOOL "$1" | python -m json.tool
}

function _yolo() {
  print 'Running `git push -f`, press [Enter] to continue...'
  read -q
  git push -f
}

## Aliases

# General
alias pd='pushd'
alias v='vim'
alias tm=_tm
alias agent='_agent'
alias be='bundle exec'
alias knife="BUNDLE_GEMFILE=/Users/zeeshan/.chef/Gemfile bundle exec knife"
alias http="~/.bin/http"

# Java
alias maven='mvn'

# Git
alias g='git'
alias l='git log'
alias m='git co master'
alias p='g pr'
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
alias clone='_clone'
alias yolo='_yolo'
alias cr='git push -u origin head'

# Viewing Data
alias j='_pretty_json'

# Mac
if [ "$SYSTEM" != 'MAC' ]; then
  alias ls='ls --color'
  alias R='R --vanilla --silent'
else
  # System is a Mac
  # Prefer Homebrew binaries to system
  export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

  # Enable CLI Colouring
  export CLICOLOR=1

  # Java for data team.
  export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

  ## Hadoop
  CDH_HOME='/Users/zeeshan/Hadoop'
  export HADOOP_HOME="${CDH_HOME}/hadoop"

  export PATH="${HADOOP_HOME}/bin:${HADOOP_HOME}:/sbin:${PATH}"

  # chruby version manager
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh

  # virtualenv locations
  export WORKON_HOME='~/.virtualenvs'
  source $(brew --prefix)/bin/virtualenvwrapper.sh
fi

# Moooo
if [[ -o login ]]; then
  (fortune -s | cowsay | lolcat) 2>/dev/null
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

#export PATH="$HOME/.yarn/bin:$PATH"
#unsetopt xtrace
#exec 2>&3 3>&-
