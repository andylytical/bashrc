#!/bin/bash

tmpdir=$(mktemp -d)
GIT=$(which git)
[[ -z "$GIT" ]] && {
    echo "ERROR: Cmd 'git' not found. Is 'git' installed?" >&2
    echo "Exiting." >&2
    exit 1
}
git clone https://github.com/andylytical/bashrc.git $tmpdir/bashrc
$tmpdir/bashrc/setup.sh
rm -rf $tmpdir
