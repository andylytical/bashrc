bb() {
    local _action="${1:-help}"
    shift
    case "$_action" in
        h|help)
            _action='--help'
            ;;
        start)
            _action=up
            ;;
        stop)
            _action=down
            ;;
    esac
    pushd ~/brewblox
    /usr/local/bin/brewblox-ctl "$_action" "${@}"
    popd
}
