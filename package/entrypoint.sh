#!/bin/bash -ex
mkdir -p image/{usr/lib32,lib,run}
cd image
cat ../lib32.txt | xargs -I {} cp -Lrv /usr/lib32/{} usr/lib32/{}
cp -Lrv /usr/lib32/ld-linux.so.2 lib
cp -Prv ../install/bin/* run
docker build -t codehz/stoneserver:latest --no-cache -f - . <<EOF
FROM scratch
ADD . /
WORKDIR /run
ENTRYPOINT ["/run/stone"]
EOF

