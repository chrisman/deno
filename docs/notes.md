# things we learned along the way

lessons learned

## Docker

Notes about docker and dockerfiles

- if you're only using one container, you don't really need a docker-compose file. Just use docker commands. (This isn't really sustainable long term.. at some point we'll need a container for a database or something. But it works for now.)

- in a dockerfile, `FROM` looks for a named local image first, then on dockerhub.

- "use multi-stage builds to keep your images lean" [src](https://docs.docker.com/develop/develop-images/multistage-build/)

- `docker run` vs `docker exec`: "docker run" seems to build images and containers. "docker exec" on the other hand runs commands inside containers. Exactly the thing I was looking for when wanting to run stuff like `deno fmt`, `deno repl` etc locally.

- Volumes: these are indeed the correct way to share data storage between a container and a host. The trick is that *docker* requires the volume to be an absolute path. *docker-compose* allows relative paths, which is obviously the more correct implementation. A little `$(shell pwd)` in the Makefile fixed all our woes and worries: you can now edit files locally and `make r` to restart the server, and you can now `make fmt` to run the formatter from inside the container on your local `.ts` files.

## Deno

Notes about deno

- apparently using a `deps.ts` file is conventional now? makes sense, and also kind of feels like making some kind of *actual* package.json file in the sense that it's a list of dependencies, but without all the extra package.json crap like scripts and metadata, etc, etc. Anyway, allows you to list all your deps in one place, which is convenient. Reduces complexity: you only have to look at one place to see all your URLs and resources. And also allows you to fetch your deps once as a single layer in your Dockerfile, so they should cache and never refetch unless you update that deps file. Question: Is this really necessary? does deno not cache deps by default? see: `Remote code is fetched and cached on first execution, and never updated until the code is run with the --reload flag. (So, this will still work on an airplane.)` [src](https://deno.land/std/manual.md#other-key-behaviors)

## Heroku

boy howdy, heroku was annoying

- Can't have Dockerfile anywhere but in the root directory:

    > The Docker build context is always set to the directory containing the Dockerfile and cannot be configured independently.

    [src](https://devcenter.heroku.com/articles/build-docker-images-heroku-yml#known-issues-and-limitations)

- tried both methods of deploying a container: using heroku.yml [1], and pushing to the container registry [2]. Turned out option 2 was the one that worked.

    [1] https://devcenter.heroku.com/articles/build-docker-images-heroku-yml

    [2] https://devcenter.heroku.com/articles/container-registry-and-runtime

    although, option 2 only worked after I did a `heroku stack:set container` as described in option 1, so who's to say whether it worked entirely by itself 🤷‍♀️

    Some aspect of the Option 1 process (possibly combined with a lack of --allow-env as described below) generated a horribly non-useful error message about not being able to access deno's cache folder, which had me chasing wild geese down seveal rabbit holes.

- also forgot that I needed to allow docker to pass the port number through an environment variable. This required a `--allow-env` flag to deno (nice) and a `const { PORT = 8000 } = Deno.env()` in `main.ts`.
