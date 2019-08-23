# build
FROM mcr.microsoft.com/windows:1809 
LABEL maintainer=michel.promonet@free.fr

WORKDIR /app

ADD https://github.com/mpromonet/webrtc-streamer/releases/download/v0.1.4/webrtc-streamer-v0.1.4-Windows-AMD64-Release.tar.gz /app/webrtc-streamer.tar.gz

RUN webrtc-streamer.exe -V

