#!/usr/bin/env bash

set -oeu pipefail

CC=$(which cookiecutter)

if [ ! -x ${CC} ]; then
    echo "Either cookiecutter was not found or is not executable; see maintainer of this container image." >&2
fi

${CC} ${ITZ_PIPELINE_CC_PROJ}
