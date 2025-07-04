# .zshrc - github.com/punkforpez

# Set the prompt to something more pleasing
PS1='%F{cyan}%m %f%b%# '

# Boring $PATH business:
# This is recently updated for NixOS
# TODO: Clean up this section
export PATH="/run/wrappers/bin:/run/current-system/sw/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/bin:/usr/local/bin"a
# For Homebrew (uncomment on MacOS / NixOS will spit out errors if active
#export PATH="/opt/homebrew/bin:$PATH"

# Basic Navigation
alias h="cd ~"
alias up="cd .."
alias ddl='cd ~/Downloads; clear; pwd; ls'

# nixOS related
alias nixedit='sudo vim /etc/nixos/configuration.nix'
alias nixbuild='sudo nixos-rebuild switch'
alias nixclean='sudo nix-collect-garbage -d'
alias redshift='hyprctl hyprsunset temperature 4500'
alias blueshift='hyprctl hyprsunset temperature 6500'
alias waybar-reload='pkill waybar && hyprctl dispatch exec waybar'
alias red='gammastep -O 4500 &' # manual use for Sway
alias blue='gammastep -O 6000 &' # manual use for Sway

# Arch Linux  related
#alias pacman='sudo pacman'
#alias pacrm='sudo pacman -Rs'
#alias pacq='sudo pacman -Q'
#alias pacorph='sudo pacman -Rns $(pacman -Qtdq)'

# Debian related
alias apt='sudo apt'
alias nala='sudo nala' # better wrapper for Apt, in main Debian repo

# Git-related
alias gpull='git pull -v'
alias gpush='git push origin master'
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
alias sf="clear; fastfetch;"
alias sfa='clear; echo; fastfetch; echo;'
alias mem='top -l1 | grep PhysMem'
alias cat='bat'
alias dfc='clear; echo; dfc -f;echo;'

# Editing and sourcing .zshrc
alias zedit="nvim ~/.zshrc"
#alias zmouse="mousepad ~/.zshrc"
#uncomment and replace with GUI editor of choice
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
# Uncomment below if not on NixOS
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
