FROM debian:wheezy
MAINTAINER Pomin Wu <pomin5@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV REFRESHED_AT 2014-11-27

RUN apt-get update && \
    apt-get install -yq php5 php-pear php5-gd php5-curl php5-sqlite php5-mysql php5-pgsql && \
    apt-get install -yq apache2 libapache2-mod-php5 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD etc/apache2/sites-enabled /etc/apache2/sites-enabled/
RUN rm /etc/apache2/sites-enabled/000-default
RUN sed -i 's/memory_limit = 128M/memory_limit = 256M/' /etc/php5/apache2/php.ini

RUN groupadd -g 1000 app && \
    useradd -u 1000 -g app --home-dir /app -m app

VOLUME ["/root", "/app"]

ADD init.sh /init.sh
ADD run.sh /run.sh

EXPOSE 80
CMD ["/run.sh"]
