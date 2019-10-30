#
# Saumon ZSH aliases
# docker
#

alias dkps="docker ps --format '{{.ID}} ~ {{.Names}} ~ {{.Status}} ~ {{.Image}}'"
alias docker-clean="docker system prune --all"
alias docker-clean-all="docker system prune --all --volumes"

docker-stop-all() {
  docker stop $(docker container ls -a -q)
}

docker_host() {
  export DOCKER_HOST=ssh://$1
}
