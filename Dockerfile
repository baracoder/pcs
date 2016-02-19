FROM centos:7

MAINTAINER Peter Schiffer <pschiffe@redhat.com>

RUN yum -y --setopt=tsflags=nodocs upgrade \
    && yum -y --setopt=tsflags=nodocs install pcs which \
    && yum -y clean all

COPY run.sh /run.sh

EXPOSE 2224

ENV PCS_PASS=secret

CMD "/run.sh"

