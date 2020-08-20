from klakegg/hugo as build
COPY ./ /site
WORKDIR /site
RUN hugo

FROM nginx:latest
LABEL maintainer Gregory Boyce <gregory@auburndaletech.com>
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /site/public /var/www/site
WORKDIR /var/www/site
