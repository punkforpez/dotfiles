# .zshrc - github.com/punkforpez
# Set the prompt to something more pleasing
PS1='%F{green}%m %f%b%# '

# A right-aligned prompt for showing current directory and shell execution numbers.
#RPROMPT='%F{pink}%~%f (%!)'

# Boring $PATH business:
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/bin:/usr/local/bin"

# Navigation
alias h="cd ~"
alias up="cd .."

# Void specific package management.
# Using vpm wrapper
alias vpm='sudo vpm'

# Distro agnostic package systems.
alias apt-get="sudo apt-get"
alias pacman='sudo pacman'
alias apt='sudo apt'
alias xi='sudo xbps-install'
alias dnf='sudo dnf'

# Taskbook specific
alias ctb='clear; tb'
alias ctbi='clear; tb -i'

# vim-style navigation
bindkey -v
bindkey -M viins ‘jk’ vi-cmd-mode
path+=('/usr/local/bin')
export PATH

# General purpose aliases
alias f='fzf'
alias ls="ls --color=auto"
alias cl="clear; ls"
alias vi='vim'
alias psa="ps aux"
alias kk="uname -mrs"
alias clp="clear;ls;pwd"
alias p3="ping -c 3"
alias treed="tree -Cd"
alias tree="tree -C"
alias tweet="rainbowstream"
alias sf="clear; sysinfo"
alias sfa='clear; echo; neofetch; echo;'
alias fetch='clear; fetch;'
alias mem='top -l1 | grep PhysMem'
alias cat='bat'
alias dfc='clear; echo; dfc -Ms; echo;'

# For fun.
alias q='clear; quote; echo'
alias cow='clear; fortune | cowsay; echo'
alias tree='alder'

# Editing and sourcing .zshrc
alias zedit="vim ~/.zshrc"
alias zmouse="mousepad ~/.zshrc"
alias zsource="source ~/.zshrc"
alias zemacs="emacs ~/.zshrc"

# Git aliases
alias glog="git log"
alias gpretty="git log --pretty=oneline"
alias ggraph="git log --graph --oneline --decorate --all"

# Move and follow file to new dir:
# Example (from ~) mvf test.txt ~/downloads will move the file
# to ~/downloads and cd to that directory.
function mvf {
  if [[ -d $*[-1] ]]; then
    mv $* && cd $*[-1]
  elif [[ -d ${*[-1]%/*} ]]; then
    mv $* && cd ${*[-1]%/*}
  fi
}
# Copy and follow file:
# Just like the mvf() function but this one only copies.
function cpf {
  if [[ -d $*[-1] ]]; then
    cp $* && cd $*[-1]
  elif [[ -d ${*[-1]%/*} ]]; then
    cp $* && cd ${*[-1]%/*}
  fi
}

# Use alt+s to insert sudo
# !!! Disabled for now
#insert_sudo () { zle beginning-of-line; zle -U "sudo " }
#zle -N insert-sudo insert_sudo
#bindkey "^[s" insert-sudo

# Must be last in .zshrc
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
