#!/bin/bash
set -x
set -e
set -o pipefail

PYTHON=${1? python exe}

case "$( uname )" in
Darwin)
    OS=macosx
    ;;
Linux):
    OS=linux
    ;;
*)
    echo Unknown OS assuming Linux
    OS=linux
    ;;
esac

${PYTHON} setup_makefile.py ${OS} tmp-$PYTHON-unlimited-api.mak
make -f tmp-$PYTHON-unlimited-api.mak clean 2>&1 | tee tmp-$PYTHON-unlimited-api.log
make -f tmp-$PYTHON-unlimited-api.mak test 2>&1 | tee -a tmp-$PYTHON-unlimited-api.log
