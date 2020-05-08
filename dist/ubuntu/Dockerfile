FROM ubuntu:18.04

# build: project sources
ADD . /src
WORKDIR /src

# build: system utilities, libraries, system Rust toolchain
RUN apt-get update
RUN apt-get -y install g++ pkg-config libssl-dev rustc cargo

# build: graph-builder binary
RUN cargo build --release --bin graph-builder && mv /src/target/release/graph-builder /usr/local/bin/

# build: policy-engine binary
RUN cargo build --release --bin policy-engine && mv /src/target/release/policy-engine /usr/local/bin/

# build: cleanup
RUN rm -rf /src $HOME/.cargo

# run: default config
WORKDIR /
CMD [ "/bin/bash"]
