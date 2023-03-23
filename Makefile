GIT_COMMIT ?= $(shell git rev-parse HEAD)
GIT_COMMIT_SHORT ?= $(shell git rev-parse --short HEAD)
GIT_TAG ?= $(shell git describe --abbrev=0 --tags 2>/dev/null || echo "v0.0.1" )

docker_build:
	DOCKER_BUILDKIT=1 docker build --build-arg ELEMENTAL_VERSION=${GIT_TAG} --build-arg ELEMENTAL_COMMIT=${GIT_COMMIT} --target elemental -t elemental-cli:${GIT_TAG}-${GIT_COMMIT_SHORT} .

license-check:
	@.github/license_check.sh
