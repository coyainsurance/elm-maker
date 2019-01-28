FROM node:10.11-slim as libsysconfcpus

WORKDIR /libsysconfcpus

RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential git

ENV DESTDIR=/sysconfcpusroot

RUN mkdir ${DESTDIR}
RUN git clone https://github.com/obmarg/libsysconfcpus.git .
RUN ./configure
RUN make && make install

FROM node:10.11-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends netbase build-essential && \
    rm -rf /var/lib/apt/lists/*

ENV PATH=/workspace/node_modules/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

COPY --from=libsysconfcpus /sysconfcpusroot/ /

WORKDIR /workspace
