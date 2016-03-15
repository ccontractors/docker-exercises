#!/usr/bin/env bash

docker build -t dockdot .

#~/.bashrc alias's for convenience

# Set these from commandline
alias dockdot="docker run -i --rm --name=dockdot -v $PWD:/input dockdot"
alias dockviz="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"

# og så kan den her skydes af til sidst, hvor output fra første
# container pibes over som input til den næste og endelig skrives ud til
# værtsmaskinens filsystem.

dockviz images --dot | dockdot  -Tpng -o output.png