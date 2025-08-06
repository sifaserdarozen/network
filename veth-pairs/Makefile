
.PHONY: docker-build docker-run docker-clean

docker-build:
	docker build -t veth-pairs -f Dockerfile .

docker-run: docker-build
	docker run -d --name veth-pairs --privileged veth-pairs

docker-clean:
	docker container rm --force veth-pairs