
# stuff
export PATH=$PATH:"/usr/local/anaconda/anaconda/bin"
alias  docker-connect="DOCKER_HOST=tcp://192.168.99.100:2376 DOCKER_CERT_PATH=/Users/patrick/.docker/machine/machines/default DOCKER_TLS_VERIFY=1 /usr/local/bin/zsh && docker info"

eval $(thefuck --alias)
function sshi () {
  ssh -i ~/.ssh/ClickDiscover.pem ec2-user@$1 ${@:2}
}
