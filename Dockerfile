#
# Build stage
#
FROM fpco/stack-build:lts as builder
MAINTAINER Pat Brisbin <pbrisbin@gmail.com>

ENV LANG en_US.UTF-8
ENV PATH /root/.local/bin:$PATH

RUN mkdir -p /src
WORKDIR /src

COPY stack.yaml hello.cabal /src/
RUN stack setup && stack install --dependencies-only

COPY . /src
RUN stack setup && stack install

#
# Runtime
#
FROM fpco/stack-run:lts
MAINTAINER Pat Brisbin <pbrisbin@gmail.com>

ENV LANG en_US.UTF-8

RUN mkdir -p /app
WORKDIR /app

# Executable(s) from build stage
COPY --from=builder /root/.local/bin/hello /app/hello

# Support resources
# COPY config /app/config
# COPY static /app/static

RUN useradd app
USER app

# Reset fpco/stack-run's dumb ENTRYPOINT
ENTRYPOINT []
CMD ["/app/hello"]
