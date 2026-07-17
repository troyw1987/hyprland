# ~/.zshrc

# ============================================================
# Oh My Zsh Core
# ============================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="heapbytes"

fpath=(/usr/share/zsh/site-functions $fpath)
plugins=(
  git
  kitty
  systemd
  safe-paste
  archlinux
  fzf
  history-substring-search
  extract
  colored-man-pages
  copypath
  copyfile
  golang
  sudo
  last-working-dir
)

source $ZSH/oh-my-zsh.sh

# ============================================================
# History
# ============================================================
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# ============================================================
# Environment / PATH
# ============================================================
export GOPATH="$HOME/go"
export GOROOT="/usr/lib/go"   # remove this line if you didn't install Go via pacman
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin:$HOME/.local/bin"

export EDITOR="nvim"
export SUDO_EDITOR="/usr/bin/nvim"

# ============================================================
# Aliases
# ============================================================
alias n="nvim"
alias restartwaybar="pkill waybar && hyprctl dispatch exec waybar"
alias openreminders="nvim ~/Documents/reminder.txt"
alias ls="lsd"

# ============================================================
# Functions
# ============================================================
function pacupdate() {
  echo "Removing orphans -> 'pacman -Qdtq | sudo pacman -Rns -'"
  pacman -Qdtq | sudo pacman -Rns -
  echo "Using yay to update -> yay -Syu"
  yay -Syu
}

# ============================================================
# Third-party init (must come after compinit, i.e. after oh-my-zsh.sh)
# ============================================================
eval "$(zoxide init zsh)"
