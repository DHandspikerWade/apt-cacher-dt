proxy_set_header user-agent $http_user_agent;
proxy_set_header Range $slice_range;

proxy_ignore_client_abort on;