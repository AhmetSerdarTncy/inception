FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    php-curl \
    php-gd \
    php-intl \
    php-mbstring \
    php-soap \
    php-xml \
    php-xmlrpc \
    php-zip \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/wordpress && \
    wget https://wordpress.org/latest.tar.gz -O /tmp/latest.tar.gz && \
    tar -xzf /tmp/latest.tar.gz -C /usr/src/wordpress/ --strip-components=1 && \
    rm /tmp/latest.tar.gz

COPY tools/www.conf /etc/php/7.4/fpm/pool.d/

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm7.4", "-F"] 