#!/bin/bash -e

if test ! -f ceph.tar.gz; then
    tar --exclude=ceph/build --exclude=ceph/*.tar --exclude=ceph/*.tar.bz2 -C /home/cephgroup/ceph-src/ -zcf ceph.tar.gz ceph/ ssh-key/
fi
sudo docker build -t adsl/ceph-dev:v1.0 .
#sudo docker build -t adsl/ceph-dev:v1.0 -f Dockerfile /home/cephgroup/ceph-src/
