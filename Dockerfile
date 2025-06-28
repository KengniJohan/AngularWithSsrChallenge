from alpine:3.22.0

COPY . /angular-challenge

WORKDIR /angular-challenge

RUN apk update \
    && apk add nodejs npm \
    && npm install -g @angular/cli \
    && ng build

from nginx:1.29.0

COPY --from=0 /angular-challenge/dist/angular-with-ssr-challenge /usr/share/nginx/html/angular-with-ssr-challenge

EXPOSE 80