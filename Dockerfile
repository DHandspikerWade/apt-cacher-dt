FROM nginx:stable

RUN \
    apt-get update \
    && apt-get install -y \
        haproxy \
        nginx \
    && rm -rf /var/lib/apt/lists/*

VOLUME /usr/share/nginx/cache
COPY stub-*.inc /etc/nginx/conf.d/
COPY default.conf /etc/nginx/templates/default.conf.template
COPY haproxy.cfg /etc/haproxy/
COPY *.html /usr/share/nginx/html/
COPY run.sh /

RUN chmod +x /run.sh
EXPOSE 3142
ENV NGINX_ENVSUBST_FILTER='CACHER_|NAMESERVER'
ENV NAMESERVER="8.8.8.8"

STOPSIGNAL SIGQUIT
ENTRYPOINT ["/run.sh"]

CMD ["nginx", "-g", "daemon off;"]