bb() {
    action="$1"
    shift
    case "$action" in
        st)
            action=status
            ;;
        start)
            action=up
            ;;
        stop)
            action=down
            ;;
        reset)
            echo "Are you sure about that?" 1>&2
            echo "If yes, use 'hard-reset'" 1>&2
            return
            ;;
        hard-reset)
            # see also:
            # https://community.brewpi.com/t/brewblox-assistence/3669/86
            pushd ~/brewblox
            curl -k -X DELETE https://localhost/spark-one/objects
            /usr/local/bin/brewblox-ctl down
            /usr/local/bin/brewblox-ctl setup
            popd
            return
            ;;
    esac
    pushd ~/brewblox
    /usr/local/bin/brewblox-ctl "$action" "${@}"
    popd
}
