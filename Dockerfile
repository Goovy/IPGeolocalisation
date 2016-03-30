FROM php:latest

RUN mkdir /usr/local/share/GeoIP

# download the city database
#RUN curl -L http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz -o /usr/local/share/GeoIP/GeoLite2-City.mmdb.gz \
#&& gunzip /usr/local/share/GeoIP/GeoLite2-City.mmdb.gz
RUN curl -L http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz -o /usr/local/share/GeoIP/GeoLiteCity.dat.gz \
&& gunzip /usr/local/share/GeoIP/GeoLiteCity.dat.gz

# download the country database
#RUN curl -L http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.mmdb.gz -o /usr/local/share/GeoIP/GeoLite2-Country.mmdb.gz \
#&& gunzip /usr/local/share/GeoIP/GeoLite2-Country.mmdb.gz
RUN curl -L http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz -o /usr/local/share/GeoIP/GeoIP.dat.gz \
&& gunzip /usr/local/share/GeoIP/GeoIP.dat.gz

RUN ln -s /usr/local/share/GeoIP/city.php /city.php

ADD scripts/ /usr/local/share/GeoIP/

CMD ["/bin/sh"]
