FROM debian:trixie-slim

ENV PATH=${PATH}:/src

RUN mkdir -p /rustdesk-server
COPY hbbr /usr/local/bin
COPY hbbs /usr/local/bin
COPY id_ed25519 /rustdesk-server
COPY id_ed25519.pub /rustdesk-server
COPY rustdesk-utils /usr/local/bin

WORKDIR /rustdesk-server

EXPOSE 21115-21119
