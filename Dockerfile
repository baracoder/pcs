FROM centos:7

MAINTAINER Peter Schiffer <pschiffe@redhat.com>

RUN yum -y --setopt=tsflags=nodocs upgrade \
    && yum -y --setopt=tsflags=nodocs install pcs which \
    && yum -y clean all

COPY run.sh /run.sh

EXPOSE 2224

RUN mkdir -p /etc/systemd/system-preset/
RUN echo 'enable pcsd.service' > /etc/systemd/system-preset/00-pcsd.preset
RUN systemctl enable pcsd
ENV container=docker


ENV PCS_PASS=secret

CMD "/run.sh"

