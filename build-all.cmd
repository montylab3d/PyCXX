setlocal
call setup-msvc90 win32
if exist c:\python27.win32\python.exe (
    c:\python27.win32\python setup_makefile.py win32 win32.mak
    nmake -f win32.mak clean all 2>&1 | c:\unxutils\tee tmp-win32-python27-build.log
    nmake -f win32.mak test 2>&1 | c:\unxutils\tee tmp-win32-python27-test.log
)

if exist c:\python32.win32\python.exe (
    c:\python32.win32\python setup_makefile.py win32 win32.mak
    nmake -f win32.mak clean all 2>&1 | c:\unxutils\tee tmp-win32-python32-build.log
    nmake -f win32.mak test 2>&1 | c:\unxutils\tee tmp-win32-python32-test.log
)

if exist c:\python33.win32\python.exe (
    c:\python33.win32\python setup_makefile.py win32 win32.mak
    nmake -f win32.mak clean all 2>&1 | c:\unxutils\tee tmp-win32-python33-build.log
    nmake -f win32.mak test 2>&1 | c:\unxutils\tee tmp-win32-python33-test.log
)

if exist c:\python34.win32\python.exe (
    c:\python34.win32\python setup_makefile.py win32 win32.mak
    nmake -f win32.mak clean all 2>&1 | c:\unxutils\tee tmp-win32-python34-build.log
    nmake -f win32.mak test 2>&1 | c:\unxutils\tee tmp-win32-python34-test.log
)

endlocal

setlocal
call setup-msvc90 win64
if exist c:\python27.win64\python.exe (
    c:\python27.win64\python setup_makefile.py win64 win64.mak
    nmake -f win64.mak clean all 2>&1 | c:\unxutils\tee tmp-win64-python27-build.log
    nmake -f win64.mak test 2>&1 | c:\unxutils\tee tmp-win64-python27-test.log
)

if exist c:\python32.win64\python.exe (
    c:\python32.win64\python setup_makefile.py win64 win64.mak
    nmake -f win64.mak clean all 2>&1 | c:\unxutils\tee tmp-win64-python32-build.log
    nmake -f win64.mak test 2>&1 | c:\unxutils\tee tmp-win64-python32-test.log
)

if exist c:\python33.win64\python.exe (
    c:\python33.win64\python setup_makefile.py win64 win64.mak
    nmake -f win64.mak clean all 2>&1 | c:\unxutils\tee tmp-win64-python33-build.log
    nmake -f win64.mak test 2>&1 | c:\unxutils\tee tmp-win64-python33-test.log
)

if exist c:\python34.win64\python.exe (
    c:\python34.win64\python setup_makefile.py win64 win64.mak
    nmake -f win64.mak clean all 2>&1 | c:\unxutils\tee tmp-win64-python34-build.log
    nmake -f win64.mak test 2>&1 | c:\unxutils\tee tmp-win64-python34-test.log
)

endlocal
