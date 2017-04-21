FROM debian:wheezy

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y octave less
RUN apt-get autoclean && apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir /source

# RUN chmod +x install.sh && ./install.sh && rm install.sh

VOLUME ["/source"]
WORKDIR /source
CMD ["octave"]
