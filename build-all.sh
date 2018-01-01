#!/bin/bash
set -e
set -x
set -o pipefail

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

for PYTHON in \
    python2.6 \
    python2.7 \
    python3.3 \
    python3.4 \
    python3.5 \
    python3.6 \
    python3.7 \
    python3.8 \
    python3.9 \
    ;
do
    if which $PYTHON >/dev/null
    then
        echo "Info: Found ${PYTHON}"
        ${PYTHON} setup_makefile.py ${OS} tmp-$PYTHON-full-api.mak
        make -f tmp-$PYTHON-full-api.mak clean 2>&1 | tee tmp-$PYTHON-full-api.log
        make -f tmp-$PYTHON-full-api.mak test 2>&1 | tee -a tmp-$PYTHON-full-api.log

        case "$PYTHON" in
        python3.3)
            ;;
        python3.*)
            ${PYTHON} setup_makefile.py ${OS} tmp-$PYTHON-limited-api.mak --limited-api=0x03040000
            make -f tmp-$PYTHON-limited-api.mak clean 2>&1 | tee tmp-$PYTHON-limited-api.log
            make -f tmp-$PYTHON-limited-api.mak test 2>&1 | tee -a tmp-$PYTHON-limited-api.log
            ;;
        esac
    fi
done
