.PHONY: setup test build-image binaries image

IMAGE_NAME ?= example/hello

# Normal, native, stack-based development
setup:
	stack setup
	stack build --fast
	stack build --fast --test --no-run-tests

test:
	stack test

# A docker image for compilation
build-image:
	docker build \
	  --tag "$(IMAGE_NAME)-build" \
	  --file docker/Dockerfile.build .

# Compile the binaries into docker/bin using the build image
binaries:
	docker run --rm \
	  --volume "$(PWD)":/src:ro \
	  --volume "$(PWD)"/docker/bin:/root/.local/bin \
	  --volume "$(PWD)"/docker/stack:/root/.stack \
	  --volume "$(PWD)"/docker/stack-work:/src/.stack-work \
	  "$(IMAGE_NAME)-build" sh -c "stack setup && stack install"

# Build a runtime image with the built binaries, but no compilation environment
image:
	docker build \
	  --tag "$(IMAGE_NAME)" \
	  --file docker/Dockerfile .
