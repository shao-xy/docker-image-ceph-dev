FROM ceph/ceph:v15
ADD ceph.tar.gz /ceph-src/
#ADD ceph-15.2.13-0-gc44bc49e7a5.tar.bz2 /ceph-src/
#COPY ./ceph-src /ceph-src/ceph/
#COPY Dockerfile /
#RUN set -x; mv /ceph-src/ceph-15.2.13-0-gc44bc49e7a5 /ceph-src/ceph \
#    && yum install -y git \
#    && git init \
#    && git add . \
#    && git commit -m "Initial ceph-15.2.13" \
RUN set -x; cd /ceph-src/ceph/ \
    && dnf install -y git libarchive python3-virtualenv \
    && ln -s pip3 /usr/bin/pip \
    && ./install-deps.sh \
    && ./do_cmake.sh \
    && cd build/ \
    && make -j64 \
    && make install -j64 \
    && cd .. \
    && rm -rf build /usr/bin/ceph_test*
