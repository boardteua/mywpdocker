FROM wordpress:latest

# Use this to install additional server shit

RUN apt-get update && \
    apt-get install -y sendmail && \
    rm -rf /var/lib/apt/lists/*
RUN echo "sendmail_path=/usr/sbin/sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini
WORKDIR /var/www/html
COPY ./entrypoint.sh /var/www/html
RUN chmod +x /var/www/html/entrypoint.sh
RUN chmod 775 /var/www/html/entrypoint.sh

COPY ./configuration/custom.ini $PHP_INI_DIR/conf.d/

CMD ["apache2-foreground"]
