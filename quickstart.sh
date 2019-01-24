#!/bin/bash

tmpdir=$(mktemp -d)
#cd $tmpdir
git clone https://github.com/andylytical/bashrc.git $tmpdir/bashrc
$tmpdir/bashrc/setup.sh
#cd ~
rm -rf $tmpdir
