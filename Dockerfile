FROM nginx:stable
VOLUME /usr/share/nginx/cache
COPY default.conf stub-*.inc /etc/nginx/conf.d/