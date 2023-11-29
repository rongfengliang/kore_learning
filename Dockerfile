FROM kore/kodev:kodev as base

WORKDIR /hello

COPY . /hello

RUN kodev build

RUN ls -sailh /hello/


FROM kore/kore:4.2.3

RUN apk add  --no-cache runit

COPY --from=base /hello/hello /app/hello

COPY hello.runit /etc/service/hello/run

RUN chmod +x /etc/service/hello/run

EXPOSE 8888

RUN  which runsvdir

ENTRYPOINT ["/sbin/runsvdir", "-P", "/etc/service"]
