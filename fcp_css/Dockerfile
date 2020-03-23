FROM openresty/openresty:buster-fat

ADD nginx/conf.d /etc/nginx/conf.d
ADD app /app/

CMD ["/usr/bin/openresty", "-g", "daemon off;"]
