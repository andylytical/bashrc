bb() {
    local _action="${1:-help}"; shift
    local _cmd=/home/pi/.local/bin/brewblox-ctl
    local _opts=( "${@}" )
    shift
    case "$_action" in
        h|help)
            _action='--help'
            ;;
        logs)
            [[ ${#_opts[@]} -lt 1 ]] && {
                echo "ERR missing service name"
                return 1
            }
            # allow adjustable linecount at end of cmd, ie:
            # bb logs SERVICE 80
            # should yield cmdline:
            # docker-compose logs -t --tail=80 SERVICE
            _cmd=docker-compose
            local _linecount=${_opts[1]:-40}
            local _tmp=( "--tail=$_linecount" "${_opts[0]}" )
            _opts=( "${_tmp[@]}" )
            ;;
        restart)
            # if additional args, assume it is a single service name to restart
            [[ ${#_opts[@]} -gt 0 ]] && {
                _cmd=docker-compose
            }
            ;;
        status|st|s)
            _cmd=docker
            _action=ps
            _opts=( '--filter' \
                    "label=com.docker.compose.project=brewblox" \
                    '--format' \
                    "table {{.Names}}\t{{.RunningFor}}\t{{.Status}}" \
                  )
            ;;
        start)
            _action=up
            # if additional args, assume it is a single service name to restart
            [[ ${#_opts[@]} -gt 0 ]] && {
                _cmd=docker-compose
                local _tmp=( '-d' "${_opts[@]}" )
                _opts=( "${_tmp[@]}" )
            }
            ;;
        stop)
            _action=down
            # if additional args, assume it is a single service name to restart
            [[ ${#_opts[@]} -gt 0 ]] && {
                _cmd=docker-compose
                _action=stop
            }
            ;;
    esac
    pushd ~/brewblox
    set -x
    "$_cmd" "$_action" "${_opts[@]}"
    set +x
    popd
}
