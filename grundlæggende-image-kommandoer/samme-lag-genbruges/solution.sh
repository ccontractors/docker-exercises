#!/usr/bin/env bash

function cleanup
{
    echo cleanup
}

trap cleanup EXIT
cleanup

git clone https://github.com/justone/dockviz.git
cd dockviz

# (se f.eks. images med ”eog images.png”. eog er en image viewer)
dockviz images -d | dot -Tpng -o images.png
dockviz containers -d | dot -Tpng -o containers.png
