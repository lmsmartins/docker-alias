# ------------------------------------
# Docker alias and function
# ------------------------------------

# Set the docker machine name as a shell variable
export DOCKER_MACHINE_NAME="default"

# Docker machine
alias dm="docker-machine"

# Start docker machine
alias dmstart="docker-machine start && \ eval $(docker-machine env ${1:-${DEFAULT_DOCKER_MACHINE:-default}})"

# Start docker machine shortcut alias
alias dms="dmstart"

# Docker machine start using the "default" name.
alias dmsd="dms default"

# Docker alias
alias d="docker"

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get container processes including stopped containers
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dri() { docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test 
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

# Docker compose
alias dc="docker-compose"
