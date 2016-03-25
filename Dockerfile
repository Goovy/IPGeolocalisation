FROM php:latest

RUN mkdir /usr/local/share/GeoIP

RUN curl -L http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz -o /usr/local/share/GeoIP/GeoLite2-City.mmdb.gz

RUN gunzip /usr/local/share/GeoIP/Geolite2-City.mmdb.gz

CMD ["/bin/sh"]
