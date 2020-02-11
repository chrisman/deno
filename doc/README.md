# deno docker container

a containerized deno application

## About

This repo contains a single multi-stage Dockerfile (`/docker/Dockerfile`) to containerize the deno dev environment.

If you'd like to see this project set up with two separate dockerfiles (in case, I don't know, you just reeeeeally love separation of concerns?) [check out this commit](https://github.com/chrisman/deno/tree/36c6d0be0e0c36a00308303d04c7763816e3c031).

## How To

### Quick start

Use the makefile. Run `make` to build the sample project and start a server listening on port 8000.

### Slow Start

You need to build the image and then run the container:

1. Build the base image: `docker build -f docker/Dockerfile -t app .`

2. Run the container: `docker run -d --name server --init -p 8000:8000 app`

## Todo

- Volumes? (How to have the container update when local `.ts` files are updated.)

## Resources

### Deno

- <https://deno.land/>

### Deno Docker

- <https://github.com/hayd/deno-docker>
