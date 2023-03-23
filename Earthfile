VERSION 0.7
FROM alpine
# renovate: datasource=docker depName=golang
ARG --global GO_VERSION=1.20-alpine3.17
# renovate: datasource=docker depName=golang
ARG --global GOLINT_VERSION=v1.51.1

version:
    FROM alpine
    RUN apk add git
    WORKDIR /build
    COPY . .
    RUN --no-cache git rev-parse HEAD > GIT_COMMIT
    RUN --no-cache git rev-parse --short HEAD > GIT_COMMIT_SHORT
    RUN --no-cache echo $(git describe --abbrev=0 --tags 2>/dev/null || echo "v0.0.1") > GIT_TAG
    SAVE ARTIFACT GIT_COMMIT GIT_COMMIT
    SAVE ARTIFACT GIT_COMMIT_SHORT GIT_COMMIT_SHORT
    SAVE ARTIFACT GIT_TAG GIT_TAG

go-deps:
    ARG GO_VERSION
    FROM golang:$GO_VERSION
    WORKDIR /build
    COPY go.mod go.sum ./
    RUN go mod download
    SAVE ARTIFACT go.mod AS LOCAL go.mod
    SAVE ARTIFACT go.sum AS LOCAL go.sum

test:
    FROM +go-deps
    RUN apk add rsync gcc musl-dev docker jq
    WORKDIR /build
    COPY . .
    ARG TEST_PATHS=./...
    ARG LABEL_FILTER=
    ENV CGO_ENABLED=1
    # Some test require the docker sock exposed
    WITH DOCKER
        RUN go run github.com/onsi/ginkgo/v2/ginkgo run --label-filter "$LABEL_FILTER" -v --fail-fast --race --covermode=atomic --coverprofile=coverage.out --coverpkg=github.com/rancher/elemental-cli/... -p -r $TEST_PATHS
    END
    SAVE ARTIFACT coverage.out AS LOCAL coverage.out

build:
    FROM +go-deps
    WORKDIR /build
    COPY . .
    ENV CGO_ENABLED=0
    COPY +version/GIT_COMMIT ./
    COPY +version/GIT_TAG ./
    ARG GIT_COMMIT=$(cat GIT_COMMIT)
    ARG GIT_TAG=$(cat GIT_TAG)
    ARG LDFLAGS="-s -w -X 'github.com/rancher/elemental-cli/internal/version.version=${GIT_TAG}' -X 'github.com/rancher/elemental-cli/internal/version.gitCommit=${GIT_COMMIT}'"
    RUN go build -o elemental-cli -ldflags "${LDFLAGS}"
    SAVE ARTIFACT elemental-cli elemental-cli AS LOCAL bin/elemental-cli

lint:
    ARG GOLINT_VERSION
    FROM golangci/golangci-lint:$GOLINT_VERSION
    WORKDIR /build
    COPY . .
    RUN golangci-lint run -n

fmt:
    FROM +go-deps
    WORKDIR /build
    COPY . .
    RUN go fmt

docs:
    FROM +go-deps
    WORKDIR /build
    COPY . .
    RUN cd docs && go run generate_docs.go
    SAVE ARTIFACT docs/ AS LOCAL ./

vet:
    FROM +go-deps
    WORKDIR /build
    COPY . .
    RUN go vet

all-lint:
  BUILD +vet
  BUILD +fmt
  BUILD +lint
