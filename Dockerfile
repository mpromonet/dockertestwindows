# build
FROM mcr.microsoft.com/windows/nanoserver:1809 
LABEL maintainer=michel.promonet@free.fr

WORKDIR /app

ADD https://github.com/mpromonet/webrtc-streamer/releases/download/v0.1.4/webrtc-streamer-v0.1.4-Windows-AMD64-Release.tar.gz /app/webrtc-streamer.tar.gz
ADD https://github.com/lucasg/Dependencies/releases/download/v1.9/Dependencies_x64_Release.zip /app/Dependencies_x64_Release.zip

RUN tar xzvf webrtc-streamer.tar.gz --strip=1 && tar -xvf Dependencies_x64_Release.zip

RUN Dependencies.exe -h || wevtutil.exe qe Application

RUN Dependencies.exe -knowndll webrtc-streamer.exe || wevtutil.exe qe Application

RUN webrtc-streamer.exe -h || powershell.exe wevtutil.exe qe Application

