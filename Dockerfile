FROM linuxserver/letsencrypt

ADD ./config/www /www
ADD ./resume /www/resume
ADD ./MarkLaPointe.zip /www/resume/MarkLaPointe.zip

# Change /config/www in default nginx configuration
RUN sed -i 's/\/config\/www/\/www/' /defaults/default
RUN chmod -R a+r /www