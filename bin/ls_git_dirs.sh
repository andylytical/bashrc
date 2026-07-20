#!/usr/bin/bash

# List all places with git dirs that should be included in the output
GIT_WORKING_DIRS=(
  "${HOME}"/working
)
SEARCH_DEPTH=2

for topdir in "${GIT_WORKING_DIRS[@]}" ; do
  find "${topdir}" \
    -maxdepth "${SEARCH_DEPTH}" \
    -type d \
    -execdir test -d {}/.git \; \
    -print \
    -prune
done
