# Haskell Docker Example

This project is an example of producing a Docker image to run a Haskell program.
It uses a two-stage approach to avoid the size overhead of a Haskell development
environment in the runtime image.

## Installation

```
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
