FROM alpine:3.17

RUN apk add --no-cache \
  mariadb-client \
  postgresql-client \
  borgbackup \
  redis

COPY create-backup /etc/periodic/daily


RUN ln -sf /dev/stdout /var/log/borgbackup.log

CMD ["busybox", "crond", "-f", "-l", "0", "-L", "/var/log/crond.log"]
