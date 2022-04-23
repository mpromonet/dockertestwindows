# build
FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-ltsc2019

ENV MSVC_PATH="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community" 
SHELL ["cmd", "/S", "/C"]

# Install Chocolatey & packages 
#RUN powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SETX PATH "%PATH%;%ALLUSERSPROFILE%\chocolatey\bin" 
#RUN choco install --ignoredetectedreboot --no-progress -y visualstudio2019buildtools --package-parameters "--add Microsoft.VisualStudio.Workload.VCTools --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.VisualStudio.Component.VC.ATLMFC --includeRecommended --nocache --installPath %MSVC_PATH%"  || IF "%ERRORLEVEL%"=="3010" EXIT 0
#RUN type C:\ProgramData\chocolatey\logs\chocolatey.log
#RUN call "%MSVC_PATH%\VC\Auxiliary\Build\vcvars64.bat"
RUN choco install --no-progress -y windows-sdk-11-version-21H2-all
RUN set
RUN dir /s /b C:\advapi32.lib

