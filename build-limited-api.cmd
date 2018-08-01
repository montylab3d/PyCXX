setlocal
rem Mm e.g. 24 36 etc
set PYTHON_VER=%1
rem win32 or win64
set PYTHON_ARCH=%2
rem 10.0, 14.0
set VC_VER=%3
set API=%4

if %PYTHON_ARCH% == win32 (
    call "C:\Program Files (x86)\Microsoft Visual Studio %VC_VER%\VC\vcvarsall.bat"
)
if %PYTHON_ARCH% == win64 (
    call "C:\Program Files (x86)\Microsoft Visual Studio %VC_VER%\VC\bin\amd64\vcvars64.bat"
)

if exist c:\python%PYTHON_VER%.%PYTHON_ARCH%\python.exe (
    c:\python%PYTHON_VER%.%PYTHON_ARCH%\python setup_makefile.py %PYTHON_ARCH% tmp-%PYTHON_ARCH%-python%PYTHON_VER%-limited-%API%-build.mak --limited-api=%API%
    if errorlevel 1 exit /b 1
    nmake -f tmp-%PYTHON_ARCH%-python%PYTHON_VER%-limited-%API%-build.mak clean all 2>&1 | c:\unxutils\tee tmp-%PYTHON_ARCH%-python%PYTHON_VER%-limited-%API%-build.log
    if not exist obj\pycxx_iter.pyd exit /b 1
    nmake -f tmp-%PYTHON_ARCH%-python%PYTHON_VER%-limited-%API%-build.mak test 2>&1 | c:\unxutils\tee tmp-%PYTHON_ARCH%-python%PYTHON_VER%-limited-%API%-test.log
    echo All done
)
endlocal
