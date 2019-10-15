FROM nvidia/cuda:10.1-devel-ubuntu18.04
MAINTAINER gkarthik <gkarthik@scripps.edu>

WORKDIR /root/

RUN apt-get update
RUN apt-get install -y wget build-essential autoconf automake libtool git pkg-config openjdk-11-jdk

RUN wget https://github.com/beagle-dev/beagle-lib/archive/v3.1.2.tar.gz && \
tar xf v3.1.2.tar.gz &&\
cd beagle-lib-3.1.2/ &&\
./autogen.sh && \
./configure --prefix=$HOME && \
make install && \
rm v3.1.2.tar.gz

ENV LD_LIBRARY_PATH="/root/lib:${LD_LIBRARY_PATH}"

RUN wget https://github.com/beast-dev/beast-mcmc/releases/download/v1.10.4/BEASTv1.10.4.tgz && \
tar xf BEASTv1.10.4.tgz && \
mv BEASTv1.10.4/bin/* /usr/local/bin && \
mv BEASTv1.10.4/lib/* /usr/local/lib && \
rm BEASTv1.10.4.tgz

