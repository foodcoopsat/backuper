FROM alpine:3.17

RUN apk add --no-cache \
  mariadb-client \
  postgresql-client \

COPY create-backup /etc/periodic/daily

CMD ["busybox", "crond", "-f", "-l", "0", "-L", "/dev/stdout"]
