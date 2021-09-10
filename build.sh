#!/bin/bash -e

if test ! -f ceph.tar.gz; then
    tar --exclude=ceph/build --exclude=ceph/*.tar* -C /home/cephgroup/ceph-src/ -zcvf ceph.tar.gz ceph/
fi
sudo docker build -t adsl/ceph-dev:v1.0 .
#sudo docker build -t adsl/ceph-dev:v1.0 -f Dockerfile /home/cephgroup/ceph-src/
