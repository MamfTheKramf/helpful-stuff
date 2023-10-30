# create a new directory and cd into it
# taken from https://unix.stackexchange.com/a/125386
function mkcdir() {
    mkdir -p -- "$1"
    cd -P -- "$1"
}