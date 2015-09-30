# ZSH Config
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="itg-text"
DISABLE_AUTO_TITLE="true"
AUTO_TITLE="false"
# COMPLETION_WAITING_DOTS="true"

plugins=(git zshmarks sprunge scala osx sbt python)
source $ZSH/oh-my-zsh.sh

# My Scripts
source "$HOME/.scripts/aliases.sh"
source "$HOME/.scripts/env.sh"
tic ~/.iterm2/xterm-256color-italic.terminfo


export PATH="/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin"

source "$HOME/.zsh/alias.sh"
source "$HOME/.zsh/alias.sh"
