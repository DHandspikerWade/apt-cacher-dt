FROM nginx:stable

RUN \
    apt-get update \
    && apt-get install -y \
        haproxy \
        nginx \
    && rm -rf /var/lib/apt/lists/*

VOLUME /usr/share/nginx/cache
COPY default.conf stub-*.inc /etc/nginx/conf.d/
COPY haproxy.cfg /etc/haproxy/
COPY run.sh /

RUN chmod +x /run.sh
EXPOSE 3142

STOPSIGNAL SIGQUIT
ENTRYPOINT ["/run.sh"]

CMD ["nginx", "-g", "daemon off;"]