FROM debian:jessie
MAINTAINER Fabio Farina <fabio.farina@garr.it>


RUN apt-get update -y && \
    apt-get install -y python-pip && \
    pip install elasticsearch-curator==3.5.0 && \
    rm -rf /var/lib/apt/lists/*

ENV INTERVAL_IN_HOURS=24
ENV OLDER_THAN_IN_DAYS="20"
ENV DELAYED_START_IN_HOURS="0"
ENV ELASTIC_HOST=elasticsearch

CMD sleep $(( 60*60*DELAYED_START_IN_HOURS )) && \
    while true; \
    do \
    echo -n "Curator run - start: `date`"; \ 
    curator --host $ELASTIC_HOST delete indices --older-than $OLDER_THAN_IN_DAYS --time-unit=days --timestring '%Y.%m.%d'; \
    echo " --> end: `date`"; \
    sleep $(( 60*60*INTERVAL_IN_HOURS )); done
