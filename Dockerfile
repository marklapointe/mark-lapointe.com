FROM linuxserver/letsencrypt

ADD ./config/www /www

# Change /config/www in default nginx configuration
RUN sed -i 's/\/config\/www/\/www/' /defaults/default
RUN chmod -R a+r /www