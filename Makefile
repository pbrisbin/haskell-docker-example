.PHONY: setup test binaries image

IMAGE_NAME ?= example/hello

# Normal, native, stack-based development
setup:
	stack setup
	stack build --fast
	stack build --fast --test --no-run-tests

# And testing
test:
	stack test

# Multi-stage build to produce executables into a runtime image
image:
	docker build --tag "$(IMAGE_NAME)" .
