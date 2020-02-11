.PHONY: all app container restart r stop s fmt clean nuke

all: container


app: .make.app
.make.app:
	docker build \
		-f docker/Dockerfile \
		-t app .
	touch .make.app


container: app .make.container
.make.container:
	docker run -d \
		--name server \
		--volume=$(shell pwd)/src:/app:rw \
		--init -p 8000:8000 app
	touch .make.container


restart: container
	docker restart server
r: restart


stop: container
	docker stop server
s: stop


fmt: container
	docker exec -it server deno fmt


clean:
	rm .make.*


# 🚨 danger 🚨
## destroys all containers and all images everywhere
nuke:
	docker rm $(docker ps -a -q) && docker rmi $(docker images -q)
