# deno sandbox

This will be a dockerized deno sandbox

## Vision

Be able to run deno applications from within the docker container without having to install deno locally.

e.g.

```
$ docker run -it --rm deno --allow-net --allow-read server.ts
```

## Strategy

1. Start with one container: just one for the server file.
1. Don't bother with docker-compose until we have more than one container.

## Roadmap

- Dockerfile
    - [x] Build a Dockerfile, OR
    - [ ] Just use the dockerhub image

## Resources

### Deno

- https://deno.land/

### Docker examples

- https://github.com/Skookum/gps/
- https://github.com/DrewDahlman/dockerize-all-the-things/

### Deno Docker

- https://hub.docker.com/r/maxmcd/deno

