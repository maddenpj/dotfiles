# ZSH Config
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="itg-text"
DISABLE_AUTO_TITLE="true"
AUTO_TITLE="false"
# COMPLETION_WAITING_DOTS="true"
#
ZSH_DISABLE_COMPFIX=true

# Oh-My-ZSH setup
# Note: performs compinit which uses fpath
plugins=(git sprunge scala macos sbt python)
fpath=(/usr/local/share/zsh-completions /usr/local/Library/Contributions $fpath)
source $ZSH/oh-my-zsh.sh
source "$HOME/.zsh/alias.sh"
# source "$HOME/.zsh/env.sh"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

tic ~/.iterm-256color-italic.terminfo


export PATH=$PATH:"$HOME/src/okta-aws/bin"
# eval "$(jenv init -)"
# jenv shell 1.8
# export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"

# gcc 4.6 breaks without this
# export MACOSX_DEPLOYMENT_TARGET=10.9
export SBT_OPTS="-Xmx8G -Xms4G -XX:+UseConcMarkSweepGC -XX:+HeapDumpOnOutOfMemoryError -Xss64M -XX:ReservedCodeCacheSize=512M"
export SBT_HYDRA_DISABLED=1
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export PATH=$HOME/bin:$PATH


# okta AWS
alias okta-aws-get='okta-aws default sts get-caller-identity'
alias clearcreds='.~/src/config-mgmt/scripts/okta-aws-allenvs --clean'

# PG
alias pg-prd='~/src/prod-tools/scripts/pg/connect_to_rds.sh -h prod-ro'
alias pg-stg='~/src/prod-tools/scripts/pg/connect_to_rds.sh -h stg'

# Redis
alias redis-local='redis-cli -a devredispass'

# koob
# alias kubestg='. ~/src/kubernetes-infra/scripts/setup_kube_config.sh stg stg-en'
alias k='kubecolor'
alias kubectl='kubecolor'
alias kubestg='source ~/src/kubernetes-infra/scripts/sso_setup_kube_config.sh stg stg'
alias kubeprd='source ~/src/kubernetes-infra/scripts/sso_setup_kube_config.sh prd prd'
alias kubeeuprd='source ~/src/kubernetes-infra/scripts/sso_setup_kube_config.sh eu-prd eu-prd'
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
