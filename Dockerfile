FROM alpine:3.22.0

COPY . /angular-challenge

WORKDIR /angular-challenge

RUN apk update \
    && apk add nodejs npm \
    && npm install -g @angular/cli \
    && rm -rf /angular-challenge/node_modules \
    && npm install

EXPOSE 4200

CMD ["ng", "serve"]