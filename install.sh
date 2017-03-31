#!/bin/bash

WORKDIR="$(cd $(dirname $0) && pwd)"

cd "$WORKDIR"

hash stow 2>/dev/null || {
    echo >&2 "GNU Stow is required to install dotfiles"; exit 1;
}

git submodule init && git submodule update

# Do real job
stow -v $(ls -d */ | grep -v misc)

if [ $? -ne 0 ]; then
    RED='\033[0;31m'
    NC='\033[0m' # No Color

    echo -e >&2 ""
    echo -e >&2 "${RED}Ooops!${NC} Something wrong while creating symoblic links."
    echo -e >&2 "Try to backup and remove your dotfiles and re-run this script."
    exit 1
fi

cat << EOF

Two steps left to finish installing:

    1. Inside tmux, 'CTRL + A' then 'I' to install plugins.

    2. Inside vim, ':PlugInstall' to install plugins.

EOF

