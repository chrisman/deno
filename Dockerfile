FROM debian:jessie

ARG DENO_VERSION

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && curl -fsSLO --compressed "https://github.com/denoland/deno/releases/download/v0.32.0/deno_linux_x64.gz" \
    && gunzip -c deno_linux_x64.gz > /usr/local/bin/deno \
    && chmod u+x /usr/local/bin/deno \
    && rm deno_linux_x64.gz 

RUN mkdir /app
WORKDIR /app
COPY main.ts /app/main.ts

ENTRYPOINT ["tail", "-f", "/dev/null"]
