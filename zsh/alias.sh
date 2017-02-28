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

function hs { history | grep -i $* }
# alias gcc='/usr/local/bin/gcc-4.6'
# alias g++='/usr/local/bin/g++-4.6'
