#!/bin/bash -ex
mkdir -p image/{usr/lib32,lib,run,tmp,data,game}
cd image
cat ../lib32.txt | xargs -I {} cp -Lrv /usr/lib32/{} usr/lib32/{}
cp -Lrv /usr/lib32/ld-linux.so.2 lib
cp -Prv ../install/bin/* /
docker build -t codehz/stoneserver:latest --no-cache -f - . <<EOF
FROM scratch
ADD . /
VOLUME ["/data","/game","/run"]
ENV APID unix:/run/apid.socket
ENTRYPOINT ["/stone"]
EOF

