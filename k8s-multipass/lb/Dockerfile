ARG HAPROXY_VERSION

FROM $HAPROXY_VERSION

COPY ./haproxy/haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

ENV HAPROXY_USER=haproxy

RUN groupadd --system $HAPROXY_USER \
  && useradd --system --gid $HAPROXY_USER $HAPROXY_USER \
  && mkdir --parents /var/lib/$HAPROXY_USER \
  && chown -R $HAPROXY_USER:$HAPROXY_USER /var/lib/$HAPROXY_USER

CMD ["haproxy", "-db", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]