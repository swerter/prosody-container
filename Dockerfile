FROM alpine:edge

MAINTAINER mjb@migadu.ch

RUN apk --update --no-cache add prosody openssl

COPY prosody.cfg.lua /etc/prosody/prosody.cfg.lua
COPY conf/prosody /etc/prosody/certs
COPY accounts /var/lib/prosody/localhost/accounts

RUN mkdir -p /var/lib/prosody/conference%2eexample%2ecom/ &&\
    chown -R prosody:prosody /var/lib/prosody/ &&\
    chown -R prosody:prosody /etc/prosody/

EXPOSE 5222 5269 5280 5281

USER prosody

CMD ["prosodyctl", "start"]
