FROM linuxserver/letsencrypt

ADD ./config/www /www
ADD ./resume /www/resume

# Change /config/www in default nginx configuration
RUN sed -i 's/\/config\/www/\/www/' /defaults/default
RUN chmod -R a+r /www