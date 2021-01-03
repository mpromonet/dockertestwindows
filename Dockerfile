# build
FROM mcr.microsoft.com/windows/servercore:ltsc2019
RUN powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SETX PATH "%PATH%;%ALLUSERSPROFILE%\chocolatey\bin" 
RUN choco install --no-progress -y windows-sdk-10-version-2004-all || type %ProgramData%\chocolatey\logs\chocolatey.log

