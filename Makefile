.PHONY: setup test binaries image

IMAGE_NAME ?= example/hello

# Normal, native, stack-based development
setup:
	stack setup
	stack build --fast
	stack build --fast --test --no-run-tests

test:
	stack test

# Compile the binaries into docker/bin using the fpco/stack-build image
binaries:
	docker run --rm \
	  --env LANG=en_US.UTF-8 \
	  --volume "$(PWD)":/src:ro \
	  --volume "$(PWD)"/docker/bin:/root/.local/bin \
	  --volume "$(PWD)"/docker/stack:/root/.stack \
	  --volume "$(PWD)"/docker/stack-work:/src/.stack-work \
	  fpco/stack-build:lts sh -c "cd /src && stack install --system-ghc"

# Build a runtime image with the built binaries, but no compilation environment
image:
	docker build --tag "$(IMAGE_NAME)" .
