FROM curlimages/curl:latest AS bins

ARG STATIC_WEB_SERVER_VERSION="v2.33.0"

USER root
WORKDIR /downloads

RUN if [ "$(uname -m)" = "x86_64" ]; then \
      curl -fLo sws.tar.gz \
        https://github.com/static-web-server/static-web-server/releases/download/${STATIC_WEB_SERVER_VERSION}/static-web-server-${STATIC_WEB_SERVER_VERSION}-x86_64-unknown-linux-musl.tar.gz; \
    elif [ "$(uname -m)" = "aarch64" ]; then \
      curl -fLo sws.tar.gz \
      https://github.com/static-web-server/static-web-server/releases/download/${STATIC_WEB_SERVER_VERSION}/static-web-server-${STATIC_WEB_SERVER_VERSION}-aarch64-unknown-linux-musl.tar.gz; \
    elif [ "$(uname -m)" = "s390x" ]; then \
      curl -fLo sws.tar.gz \
        https://github.com/static-web-server/static-web-server/releases/download/${STATIC_WEB_SERVER_VERSION}/static-web-server-${STATIC_WEB_SERVER_VERSION}-s390x-unknown-linux-musl.tar.gz; \
    else \
      echo "Unsupported architecture: $(uname -m)"; exit 1; \
    fi && \
    tar xf sws.tar.gz && \
    find . -name "static-web-server" -exec mv {} /usr/local/bin/static-web-server \;

FROM scratch

WORKDIR /app
EXPOSE 8000

COPY public/index.html .
COPY --from=bins /usr/local/bin/static-web-server /usr/local/bin/static-web-server

CMD ["/usr/local/bin/static-web-server", "--host=0.0.0.0", "--port=8000", "--page404=index.html", "--root=/app", "--log-level=info", "--health"]
