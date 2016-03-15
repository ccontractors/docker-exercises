FROM debian:stable
# Installer dot
RUN apt-get update && apt-get install -y graphviz && rm -rf /var/lib/apt/lists/*
# Lad brugeren have standard bruger id
USER 1000
WORKDIR /input
# Dette program startes når containeren køres.
ENTRYPOINT ["dot"]
# Hvis brugeren ikke angiver noget – giv ham ”help”
CMD ["-?"]

