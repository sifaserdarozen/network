
.PHONY: docker-build docker-run docker-clean

docker-build:
	docker build -t namespace-fragment -f Dockerfile .

docker-run: docker-build
	docker run -d --name namespace-fragment --cap-add NET_ADMIN --cap-add CAP_SYS_ADMIN --security-opt apparmor=unconfined namespace-fragment

docker-clean:
	docker container rm --force namespace-fragment