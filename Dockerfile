FROM node:17-slim

# check node version
RUN node --version

# install deps for installation command
RUN apt-get update
RUN apt-get install -y wget zip

# install latest imagemagick
RUN t=$(mktemp) && wget 'https://dist.1-2.dev/imei.sh' -qO "$t" && bash "$t" && rm "$t"

#remove caches
RUN rm -rf /var/lib/apt/lists/*
