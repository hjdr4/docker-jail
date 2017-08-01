FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -qqy \
	openssh-client \
	terminator \
	locales \
	gosu \
	dbus-x11 \
	procps \
	&& locale-gen en_US.UTF-8 en_us && dpkg-reconfigure locales && dpkg-reconfigure locales && locale-gen C.UTF-8 && /usr/sbin/update-locale LANG=C.UTF-8

RUN bash -c 'echo -ne "Host *\nStrictHostKeyChecking no\n" >>/etc/ssh/ssh_config'

ADD content /

ENTRYPOINT ["/entrypoint"]
