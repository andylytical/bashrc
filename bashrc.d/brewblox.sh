bb() {
    local _action="${1:-help}"
    local _cmd=/home/pi/.local/bin/brewblox-ctl
    shift
    case "$_action" in
        h|help)
            _action='--help'
            ;;
        status|stat|s)
            _cmd=docker-compose
            _action=ps
            ;;
        start)
            _action=up
            ;;
        stop)
            _action=down
            ;;
    esac
    pushd ~/brewblox
    "$_cmd" "$_action" "${@}"
    popd
}
