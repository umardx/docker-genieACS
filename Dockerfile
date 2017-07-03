FROM sameersbn/ubuntu:14.04.20140508
MAINTAINER umar@arc.itb.ac.id

RUN apt-get update
RUN apt-get install -y g++ zlib1g-dev libssl-dev build-essential \
	openssl libreadline6 libreadline6-dev zlib1g libsqlite3-0 \
	libsqlite3-dev sqlite libxml2 libxml2-dev libxslt-dev autoconf \
	libc6-dev ncurses-dev automake libtool bison subversion tcl git checkinstall \
	libyaml-dev sudo unzip redis-server mongodb curl joe tmux

ADD assets/installers/ /app/installers/

RUN chmod 755 /app/installers/nodejs
RUN /app/installers/nodejs

RUN chmod 755 /app/installers/ruby
RUN /app/installers/ruby

RUN chmod 755 /app/installers/genieacs
RUN /app/installers/genieacs

RUN chmod 755 /app/installers/genieacs-gui
RUN /app/installers/genieacs-gui

ENTRYPOINT ["/app/init"]

CMD ["appStart"]
