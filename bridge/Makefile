
.PHONY: docker-build docker-run docker-clean

docker-build:
	docker build -t bridge -f Dockerfile .

docker-run: docker-build
	docker run -d --name bridge --cap-add NET_ADMIN --cap-add CAP_SYS_ADMIN --security-opt apparmor=unconfined bridge

docker-clean:
	docker container rm --force bridge