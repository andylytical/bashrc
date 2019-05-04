bb() {
    action="$1"
    shift
    case "$action" in
        st) action=status
            ;;
        start) action=up
            ;;
        stop) action=down
            ;;
    esac
    pushd ~/brewblox
    /usr/local/bin/brewblox-ctl "$action" "${@}"
    popd
}
