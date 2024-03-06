alias art="php artisan"
alias tinker="psysh"

alias p='([ -f vendor/bin/pest ] && vendor/bin/pest) || ([ -f vendor/bin/phpunit ] && vendor/bin/phpunit) || echo "No tests found"'
function pf {
  ([ -f vendor/bin/pest ] && vendor/bin/pest --filter $@ ) \
  || ([ -f vendor/bin/phpunit ] && vendor/bin/phpunit --filter $@ ) \
  || echo "No tests found"
}
alias pa="vendor/bin/phpstan analyse"
alias pi="vendor/bin/pint"

# easily switch php-versions with brew
swphp() {
    current_php=$(ls -l `which php` | grep -o 'php@\d\.\d' || echo 'php')
    desired_php="php@$1"

    if [ "$current_php" = "$desired_php" ]; then
        echo "already using $desired_php"
        return
    fi

    echo "switching from $current_php to $desired_php"

    # my homebrew runs under one user, but I have multiple
    sudo -u seb brew unlink $current_php
    sudo -u seb brew link $desired_php --force
}

