include /etc/nginx/conf.d/stub-proxy.inc;

proxy_cache apt-cache;
slice 1m;

proxy_ignore_headers Expires Cache-Control;

proxy_cache_valid 200 206 30d;
proxy_cache_valid 301 302 30m;
proxy_cache_valid 404 410 1h;

proxy_cache_use_stale error timeout http_500 http_502 http_503 http_504;
proxy_cache_revalidate on;
proxy_cache_min_uses 1;
proxy_cache_bypass $needs_bypass;

# cache full files instead of just chunks
proxy_cache_lock on;
proxy_cache_lock_timeout 10m;
proxy_cache_lock_age 180s;

# This header should be enabled by default
add_header X-Cache-Status $upstream_cache_status;
log_not_found on;