# Haskell Docker Example

This project is an example of producing a Docker image to run a Haskell program.
It uses a two-stage approach to avoid the size overhead of a Haskell development
environment in the runtime image.

It includes:

- A `Dockerfile.build`, to create an image with a compilation environment
- A `Dockerfile`, to create an image with a runtime environment
- A `Makefile` with tasks to do The Things
- A `circle.yml` with test, build, and (stubbed) deployment steps

## Installation

```
make build-image
make binaries
make image
```

## Usage

```
docker run --rm example/hello
```

## Development & Testing

```
make setup
make test
```

---

[CHANGELOG](./CHANGELOG.md) | [LICENSE](./LICENSE)
