FROM phusion/baseimage:0.9.16

ENV DEBIAN_FRONTEND noninteractive

ENV HOME /root

ADD configure.sh /usr/local/bin/configure
ADD plexmediaserver /default_plexmediaserver
ADD firstrun.sh /etc/my_init.d/firstrun.sh
ADD plex.sh /etc/service/plex/run

RUN ln -s -f /bin/true /usr/bin/chfn && \
	chmod +x /etc/my_init.d/firstrun.sh && \
	chmod +x /etc/service/plex/run

CMD ["/sbin/my_init"]

EXPOSE 32400

ENTRYPOINT ["/etc/my_init.d/firstrun.sh"]