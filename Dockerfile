# build
FROM mcr.microsoft.com/windows/servercore:ltsc2019

ENV MSVC_PATH="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community" 

# Install Chocolatey & packages 
RUN powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SETX PATH "%PATH%;%ALLUSERSPROFILE%\chocolatey\bin" 
RUN choco install --debug --verbose --ignoredetectedreboot --no-progress -y visualstudio2019buildtools --package-parameters "--installPath %MSVC_PATH%" --version=16.3.2.0 || IF "%ERRORLEVEL%"=="3010" EXIT 0
RUN type C:\ProgramData\chocolatey\logs\chocolatey.log
RUN call "%MSVC_PATH%\VC\Auxiliary\Build\vcvars64.bat"

