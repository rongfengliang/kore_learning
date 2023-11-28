FROM kore/kodev:kodev as base

WORKDIR /hello

COPY . /hello

RUN kodev build


FROM kore/kore:4.2.3
WORKDIR /app
COPY --from=base /hello/hello.so /app/hello.so
COPY conf/hello.conf /app/conf/hello.conf
EXPOSE 8888
ENTRYPOINT ["kore","-f", "-c", "/app/conf/hello.conf"]

