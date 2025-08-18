FROM docker.io/fedora:42
WORKDIR /content
COPY setup.sh
run ./setup.sh
EXPOSE 8080