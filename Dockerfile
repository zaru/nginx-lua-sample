FROM openresty/openresty:buster-fat
RUN opm get ledgetech/lua-resty-http

ADD conf.d/app.conf /etc/nginx/conf.d/app.conf
ADD conf.d/fcp_css.lua /etc/nginx/conf.d/fcp_css.lua
ADD app /app/

CMD ["/usr/bin/openresty", "-g", "daemon off;"]
