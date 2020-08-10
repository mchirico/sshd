PROJECT = cwxstat-23
NAME = sshd
TAG = dev
TEST = test
QT = qt

.PHONY: kind
kind:
	kind load docker-image gcr.io/$(PROJECT)/$(NAME):$(TAG)



.PHONY: docker-build
docker-build:
	docker build -t gcr.io/$(PROJECT)/$(NAME):$(TAG) -f Dockerfile .


daemon:
	docker run -p 2200:2200 --rm -it -d --name $(NAME) gcr.io/$(PROJECT)/$(NAME):$(TAG)

run:
	docker run -p 2200:2200 --rm -it --name $(NAME)  gcr.io/$(PROJECT)/$(NAME):$(TAG) 

stop:
	docker stop $(NAME)

logs:
	docker logs $(NAME)
