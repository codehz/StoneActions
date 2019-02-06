#!/bin/bash -ex
mkdir -p image/{usr/lib32,lib,run/{data,game},tmp,etc}
cd image
cat ../lib32.txt | xargs -I {} cp -Lrv /usr/lib32/{} usr/lib32/{}
cp -Lrv /usr/lib32/ld-linux.so.2 lib
cp -Prv ../install/bin/* run
echo "hosts: files mymachines myhostname resolve [!UNAVAIL=return] dns">etc/nsswitch.conf
docker build -t codehz/stoneserver:latest --no-cache -f - . <<EOF
FROM scratch
ADD . /
VOLUME ["/run/data","/run/game","/tmp"]
WORKDIR /run
ENV APID unix:/tmp/apid.socket
ENTRYPOINT ["/run/stone"]
EOF

