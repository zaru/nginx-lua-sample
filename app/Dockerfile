FROM openresty/openresty:buster-fat
RUN opm get ledgetech/lua-resty-http

ADD nginx/conf.d /etc/nginx/conf.d
ADD app /app/

CMD ["/usr/bin/openresty", "-g", "daemon off;"]
