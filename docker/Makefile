IMAGE_NAME?=thekyz-ci
CONTAINER_NAME?=jenkins-master

build:
	@docker build -t $(IMAGE_NAME) .
	#@docker pull $(CONTAINER_VERSION) 

run:
	@docker run -p 8080:8080 --name=$(CONTAINER_NAME) -d --env JAVA_OPTS="-Xmx8192m" --env JENKINS_OPTS="--handlerCountMax=300" $(IMAGE_NAME)

start:
	@docker start $(CONTAINER_NAME)

stop:
	@docker stop $(CONTAINER_NAME)

clean:	stop
	@docker rm $(CONTAINER_NAME)

