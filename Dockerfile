FROM kore/kodev:kodev as base

WORKDIR /hello

COPY . /hello

RUN kodev build

RUN ls -sailh /hello/


FROM alpine:3.18.4
WORKDIR /app
RUN apk update && apk add  --no-cache runit

COPY --from=kore/kore:4.2.3 /lib/libssl.so.1.1  /lib/libssl.so.1.1
COPY --from=kore/kore:4.2.3 /lib/libcrypto.so.1.1  /lib/libcrypto.so.1.1

COPY --from=base /hello/hello /app/hello

COPY hello.runit /etc/service/hello/run

RUN chmod +x /etc/service/hello/run &&  ln -s /lib/libssl.so.1.1  /usr/lib/libssl.so.1.1 && ln -s /lib/libcrypto.so.1.1 /usr/lib/libcrypto.so.1.1
EXPOSE 8888
CMD ["/usr/bin/runsvdir", "-P", "/etc/service"]

