@echo off
if "%1" == "win32" (
    if exist "%VS90COMNTOOLS%vsvars32.bat" (
        call "%VS90COMNTOOLS%vsvars32.bat"
    ) else (
        if exist "%LOCALAPPDATA%\Programs\Common\Microsoft\Visual C++ for Python\9.0\vcvarsall.bat" (
            call "%LOCALAPPDATA%\Programs\Common\Microsoft\Visual C++ for Python\9.0\vcvarsall.bat" x86
        ) else (
            echo Error: Cannot find MSVC 9.0
            exit /b 1
        )
    )
) else (
    if "%1" == "win64" (
        if exist "%VS90COMNTOOLS%vsvars64.bat" (
            call "%VS90COMNTOOLS%vsvars64.bat"
        ) else (
            if exist "%LOCALAPPDATA%\Programs\Common\Microsoft\Visual C++ for Python\9.0\vcvarsall.bat" (
                call "%LOCALAPPDATA%\Programs\Common\Microsoft\Visual C++ for Python\9.0\vcvarsall.bat" x64
            ) else (
                echo Error: Cannot find MSVC 9.0
                exit /b 1
            )
        )
    ) else (
        echo Error: unsupported platform %1
        exit /b 1
    )
)
