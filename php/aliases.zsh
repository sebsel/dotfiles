alias p='vendor/bin/phpunit'
alias pf='vendor/bin/phpunit --filter'

# helperfunction to run phan in a docker container
phan() {
    docker run -v $PWD:/mnt/src --rm \
        -u "$(id -u):$(id -g)" cloudflare/phan:latest $@
    return $?
}
    
