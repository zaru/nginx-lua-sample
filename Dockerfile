FROM openresty/openresty:buster-fat
RUN opm get ledgetech/lua-resty-http

ADD conf.d/app.conf /etc/nginx/conf.d/app.conf
ADD app /app/

CMD ["/usr/bin/openresty", "-g", "daemon off;"]
