FROM 783872453/ubuntu-apache-mysql-php:latest

RUN DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get upgrade --yes \
 && apt-get install --yes --no-install-recommends \
                    apg wget unzip

COPY init.sh /cbs/
COPY supervisor-freeradius.conf /cbs/
COPY freeradius-default-site /cbs/

CMD ["sh", "/cbs/init.sh"]

EXPOSE 1812 1813 80
