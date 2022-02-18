FROM rustlang/rust:nightly

COPY . /app

WORKDIR /app

RUN cargo install cargo-nextest; \
    cargo install rustfilt; \
    rustup component add llvm-tools-preview

ENV PATH="${PATH}:/usr/local/rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/bin"
ENV RUSTFLAGS="-C instrument-coverage"
ENV LLVM_PROFILE_FILE='nextest-cov-%m.profraw'

RUN cargo nextest run

ENTRYPOINT ["/app/report"]
