# .zshrc - github.com/punkforpez

# Set the prompt to something more pleasing
PS1='%F{cyan}%m %f%b%# '
# Ancient right-fixed prompt from my Arch days
# RPROMPT='%F{pink}%~%f (%!)'

# Boring $PATH business:
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/bin:/usr/local/bin"a
export PATH="/opt/homebrew/bin:$PATH"

# Basic Navigation
alias h="cd ~"
alias up="cd .."
alias ddl='cd ~/Downloads; clear; pwd; ls'

# pacman related
alias pacman='sudo pacman'
alias pacrm='sudo pacman -Rs'
alias pacq='sudo pacman -Q'
alias pacorph='sudo pacman -Rns $(pacman -Qtdq)'

# Debian related
alias apt='sudo apt'
alias nala='sudo nala' # better wrapper for Apt, in main Debian repo

# Git-related
alias gpull='git pull -v'
alias gpush='git push origin master'
alias gcm='git commit -m'
alias gadd='git add .'

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
alias sf="clear; ~/bin/ufetch-macos"
alias whale="clear; whale; echo;"
alias sfa='clear; echo; neofetch; echo;'
alias mem='top -l1 | grep PhysMem'
alias cat='bat'
alias dfc='clear; echo; dfc -f;echo;'

# Editing and sourcing .zshrc
alias zedit="vim ~/.zshrc"
alias zmouse="mousepad ~/.zshrc"
alias zsource="source ~/.zshrc"

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

# Syntax Highlighting - must be last in .zshrc
#eval "$(starship init zsh)"
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
