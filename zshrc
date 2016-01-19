# ZSH Config
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="itg-text"
DISABLE_AUTO_TITLE="true"
AUTO_TITLE="false"
# COMPLETION_WAITING_DOTS="true"

plugins=(git zshmarks sprunge scala osx sbt python composer)
source $ZSH/oh-my-zsh.sh
source "$HOME/.zsh/alias.sh"
source "$HOME/.zsh/env.sh"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# oh-my-zsh performs compinit which uses fpath
fpath=(/usr/local/share/zsh-completions /usr/local/Library/Contributions $fpath)
source $ZSH/oh-my-zsh.sh

tic ~/.iterm-256color-italic.terminfo


export PATH=$PATH:"/usr/local/bin"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
