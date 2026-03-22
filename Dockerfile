FROM nginx:1-trixie
LABEL org.opencontainers.image.source=https://github.com/DHandspikerwade/apt-cacher-dt

RUN \
    apt-get update \
    && apt-get install -y \
        haproxy \
        tinyproxy \
    && rm -rf /var/lib/apt/lists/*

VOLUME /usr/share/nginx/cache
COPY etc /etc
COPY *.html /usr/share/nginx/html/
COPY run.sh /

RUN chmod +x /run.sh
EXPOSE 3142
ENV NGINX_ENVSUBST_FILTER='CACHER_|NAMESERVER'
ENV NAMESERVER="8.8.8.8"

STOPSIGNAL SIGQUIT
ENTRYPOINT ["/run.sh"]

CMD ["nginx", "-g", "daemon off;"]