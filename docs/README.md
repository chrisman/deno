# deno container

a containerized deno application, lovingly nicknamed `Jimmy Deno`

🚀 <https://jimmy-deno.herokuapp.com/>

## About

This repo contains a single multi-stage Dockerfile (`/Dockerfile`) to containerize the deno dev environment.

If you'd like to see this project set up with two separate dockerfiles (in case, I don't know, you just reeeeeally love separation of concerns?) [check out this commit](https://github.com/chrisman/deno/tree/36c6d0be0e0c36a00308303d04c7763816e3c031).

## How To

there are two ways to get started:

1. the Quick Start way

2. the Slow Start way

### Quick Start

Use the makefile. Run `make` to build the sample project and start a server listening on port 8000.

### Slow Start

You need to build the image and then run the container. Once again, these commands can be found in the makefile. But, here they are anyway:

1. Build the base image: `docker build -f docker/Dockerfile -t app .` This creates an image named "app"

2. Run the container: `docker run -d --name server --init -p 8000:8000 app` This creates a container named "server" from the "app" image, starts the server, and starts listening on port 8000. open localhost:8000.

3. Make some changes. `make fmt` to format your TS. `make r` to restart the `server` container. Refresh your browser to see your changes

## Roadmap

Stuff to do

### Todo

- [ ] data layer
    - [ ] migrate to docker-compose
    - [ ] dockerize db layer (postgres?), and add to docker-compose

### Done
    
- [x] Volumes? (How to have the container update when local `.ts` files are updated.)

- [x] deployment: deploy the container to heroku

## Resources

- <https://deno.land/>
- <https://github.com/hayd/deno-docker>
