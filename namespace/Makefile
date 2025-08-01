
.PHONY: docker-build docker-run docker-clean

docker-build:
	docker build -t namespace -f Dockerfile .

docker-run: docker-build
	docker run -d --name namespace --cap-add NET_ADMIN --cap-add CAP_SYS_ADMIN --security-opt apparmor=unconfined namespace

docker-clean:
	docker container rm --force namespace