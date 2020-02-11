# deno docker container

a containerized deno application

## About

This repo contains a base image at `/docker/Dockerfile.deno` and an example project image at `/docker/Dockerfile`

## How To

### Quick start

Use the makefile. Run `make` to build the sample project and start a server listening on port 8000.

### Slow Start

1. Build the base image: `docker build -f docker/Dockerfile.deno -t deno .` (Call the target whatever you want. But in this example `/docker/Dockerfile` is looking for a base image called "deno".

2. Build your project: `docker build -f docker/Dockerfile -t app . && docker run -it --init -p 8000:8000 app`

## Resources

### Deno

- <https://deno.land/>

### Deno Docker

- <https://github.com/hayd/deno-docker>
