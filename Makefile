.PHONY: all app container restart r stop s 

all: container


app: .make.app
.make.app:
	docker build -f docker/Dockerfile -t app .
	touch .make.app


container: app .make.container
.make.container:
	docker run -d --name server --init -p 8000:8000 app
	touch .make.container


restart: container
	docker restart server
r: restart


stop: container
	docker stop server
s: stop


clean:
	rm .make.*


# danger:
nuke:
	docker rm $(docker ps -a -q) && docker rmi $(docker images -q)
