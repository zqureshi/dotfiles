## General
#PS1='[\u@\h \W]\$ '
bind '"\t":menu-complete'
shopt -s cdspell
shopt -s nocaseglob

## Variables
export TERM='xterm-256color'
export EDITOR='vim'

## Custom Aliases
alias pacman='sudo pacman'
alias ls='ls --color'
alias R='R --vanilla --silent'


## SSH
alias ted='ssh zqureshi@teddie.socis.ca'
alias cdf='ssh g0zee@greywolf.cdf.toronto.edu'
alias cslab='ssh g0zee-cdf@wifi.cs.toronto.edu'

## SOCKS Proxy to tEddie via a tunnel through CDF
function tunnel {
  # Check if tunnel is already running
  pgrep -f tEd-Tunnel > /dev/null
  if [[ "${?}" -eq "0" ]]
  then
    echo "Tunnel Already Setup"
    return
  fi

  ssh -fN -L 8022:teddie.socis.ca:22 g0zee@cdf.toronto.edu
  ssh -fN -D 1080 -p 8022 zqureshi@localhost tEd-Tunnel

  # Notify user
  echo "Tunnel Setup"
}

## SOCKS Proxy via CDF
function cdf-tunnel {
  # Check if tunnel is already running
  pgrep -f CDF-Tunnel > /dev/null
  if [[ "${?}" -eq "0" ]]
  then
    echo "Tunnel Already Setup"
    return
  fi

  ssh -fN -D 1080 g0zee@cdf.toronto.edu CDF-Tunnel

  # Notify user
  echo "Tunnel Setup"
}

## SOCKS Proxy to AWS via a tunnel through CDF
function aws-tunnel {
  # Check if tunnel is already running
  pgrep -f AWS-Tunnel > /dev/null
  if [[ "${?}" -eq "0" ]]
  then
    echo "Tunnel Already Setup"
    return
  fi

  ssh -fN -L 8022:zqureshi.in:22 g0zee@cdf.toronto.edu
  ssh -fN -D 1080 -p 8022 -i .ssh/zqureshi.pem ec2-user@localhost AWS-Tunnel

  # Notify user
  echo "Tunnel Setup"
}
