# https://github.com/punkforpez/dotfiles.git
# zshrc

# Set the prompt to something more pleasing
PS1='%F{cyan}%m %f%b%# '

# Boring $PATH business:
export PATH="/run/wrappers/bin:/run/current-system/sw/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/bin:/usr/local/bin"a

# For Homebrew (uncomment on MacOS / NixOS will spit out errors if active
#export PATH="/opt/homebrew/bin:$PATH"

# Basic Navigation
alias h="cd ~"
alias up="cd .."
alias ddl='cd ~/Downloads; clear; pwd; ls'
alias cdc='cd ~/.config/; pwd'

# nixOS Related
alias nixedit='sudo hx /etc/nixos/configuration.nix'
alias nixbuild='sudo nixos-rebuild switch'
alias nixclean='sudo nix-collect-garbage -d'
alias nixtest='nix-shell -p'

# Hyprland/Niri related
alias redshift='hyprctl hyprsunset temperature 4500'
alias blueshift='hyprctl hyprsunset temperature 6500'
alias waybar-reload='pkill waybar && hyprctl dispatch exec waybar'
alias red='wlsunset -o DP-1 -g 0.9 &'
alias red-night='wlsunset -o DP-1 -g 0.75 &'
alias blue='pkill wlsunset'
#alias red='gammastep -O 4000 &' # manual use for Sway
#alias blue='gammastep -O 5000 &' # manual use for Sway

# Arch Linux  related
#alias pacman='sudo pacman'
#alias pacrm='sudo pacman -Rs'
#alias pacq='sudo pacman -Q'
#alias pacorph='sudo pacman -Rns $(pacman -Qtdq)'

# Debian related
#alias apt='sudo apt'
#alias nala='sudo nala' # better wrapper for Apt, in main Debian repo

# Git-related
alias gpull='git pull -v'
alias gpush='git push origin master'
alias gadd='git add .'
alias gdir='cd ~/dotfiles; pwd'

# vim-style navigation
bindkey -v
bindkey -M viins ‘jk’ vi-cmd-mode
path+=('/usr/local/bin')
export PATH

# General purpose aliases
#alias f='fzf'
alias ls="ls --color=auto"
alias cl="clear; ls"
alias vi='nvim'
alias psa="ps aux"
alias kk="uname -mrs"
alias clp="clear;ls;pwd"
alias p3="ping -c 3"
alias sf="clear; fastfetch --kitty-direct ~/.config/fastfetch/nix2.png"
alias matrix="cmatrix -abu 6"
#alias sf="clear; fastfetch --kitty-direct ~/.config/fastfetch/cat.png"
#alias sfa='clear; echo; fastfetch; echo;'

# Utility 
alias mem='top -l1 | grep PhysMem'
alias cat='bat'
alias dfc='clear; echo; dysk;echo;'

# Editing and sourcing .zshrc
alias zedit="hx ~/.zshrc"
alias zsource="source ~/.zshrc"

# Open in fzf
f() {
  selection=$(fzf --preview 'bat --style=numbers --color=always {} || ls -al {}')

  if [[ -d "$selection" ]]; then
      cd "$selection" || return
  elif [[ -f "$selection" ]]; then
      nvim "$selection"
  fi
}

# Move and follow file to new dir:
# Example (from ~) mvf test.txt ~/downloads
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
