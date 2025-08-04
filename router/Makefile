
.PHONY: docker-build docker-run docker-clean

docker-build:
	docker build -t router -f Dockerfile .

# we need --privileged mode in order to avoid error
# sysctl: error setting key 'net.ipv4.ip_forward': Read-only file system
docker-run: docker-build
	docker run -d --name router --privileged router

docker-clean:
	docker container rm --force router