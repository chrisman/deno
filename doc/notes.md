# things we learned along the way

lessons learned

## Docker

Notes about docker and dockerfiles

- if you're only using one container, you don't really need a docker-compose file. Just use docker commands. (This isn't really sustainable long term.. at some point we'll need a container for a database or something. But it works for now.)

- in a dockerfile, `FROM` looks for a named local image first, then on dockerhub.

## Deno

Notes about deno

- apparently using a `deps.ts` file is conventional now? makes sense, and also kind of feels like making some kind of *actual* package.json file in the sense that it's a list of dependencies, but without all the extra package.json crap like scripts and metadata, etc, etc. Anyway, allows you to list all your deps in one place, which is convenient. Reduces complexity: you only have to look at one place to see all your URLs and resources. And also allows you to fetch your deps once as a single layer in your Dockerfile, so they should cache and never refetch unless you update that deps file. Question: Is this really necessary? does deno not cache deps by default? see: `Remote code is fetched and cached on first execution, and never updated until the code is run with the --reload flag. (So, this will still work on an airplane.)` [src](https://deno.land/std/manual.md#other-key-behaviors)
