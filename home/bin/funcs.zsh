zman() {
    PAGER="less -g -s '+/^       "$1"'" man zshall
}

mkcd () {
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

con() {
    vim "$1".cc "$1".in "$1".ok
}
