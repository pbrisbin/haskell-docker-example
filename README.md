**ARCHIVED**: this project has stagnated and fallen out of line with current
best practices. For a more up to date example, please see a live project such
as https://github.com/restyled-io/restyled.io.

# Haskell Docker Example

This project is an example of producing a Docker image to run a Haskell program.
It uses the new multi-stage build approach to avoid the size overhead of a
Haskell development environment in the runtime image.

## Installation

```
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
