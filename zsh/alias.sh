alias ltr='ls -ltr'
alias lt='ls -lt'
alias rsync-dir='rsync -avz --no-perms'
alias reload='echo "Reloading zsh configuration"; source ~/.zshrc'
# alias j='jump'
# alias l='showmarks'
# alias h='history'
alias wget-rip='wget -mkEpnp -e robots=off'
alias gs='git status'
alias gc='git clone'
alias github-push='git push origin master'

alias bc='brew cask'

alias tmuxls='tmux list-sessions'
alias tmuxa='tmux attach -t'


function convert_slack_width  { convert $1 -resize 128x "${1:r}-i.${1:e}" }
function convert_slack_height { convert $1 -resize x128 "${1:r}-i.${1:e}" }
function hs { history | grep -i $* }
# alias gcc='/usr/local/bin/gcc-4.6'
# alias g++='/usr/local/bin/g++-4.6'

alias gpg='gpg1'
