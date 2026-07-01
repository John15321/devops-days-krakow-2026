# Minimal extension of the official Marp CLI image.
# Adds bash + make so the Makefile/scripts work inside the container.
# Built and run via Podman (see Makefile / compose.yaml).
FROM marpteam/marp-cli:latest

USER root

# Base image is Debian-based; bash is usually present, make is not.
RUN apt-get update && \
    apt-get install -y --no-install-recommends bash make && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /slides

# Reset entrypoint (base image entrypoint is `marp`) so we can run scripts/shells
ENTRYPOINT []
CMD ["/bin/bash"]
