# ZSH Config
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="itg-text"
DISABLE_AUTO_TITLE="true"
AUTO_TITLE="false"
# COMPLETION_WAITING_DOTS="true"

source "$HOME/.zsh/alias.sh"
source "$HOME/.zsh/env.sh"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Oh-My-ZSH setup
# Note: performs compinit which uses fpath
plugins=(git zshmarks sprunge scala osx sbt python)
fpath=(/usr/local/share/zsh-completions /usr/local/Library/Contributions $fpath)
source $ZSH/oh-my-zsh.sh

tic ~/.iterm-256color-italic.terminfo


export PATH="/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/Users/patrick/.bin"
eval "$(jenv init -)"
