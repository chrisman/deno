.PHONY: all deno app serve

all: serve

deno: .make.deno
.make.deno:
	docker build -f docker/Dockerfile.deno -t deno .
	touch .make.deno

app: deno .make.app
.make.app: src/*.ts
	docker build -f docker/Dockerfile -t app .
	touch .make.app

serve: app
	docker run -it --init -p 8000:8000 app

clean:
	rm .make.*
