ARG DOWNLOAD_DIR='/downloads'

FROM curlimages/curl:latest AS downloader

USER root

ARG INDEX='https://gist.githubusercontent.com/meysam81/07cda6ece739cfa41a3f842382c1b230/raw/49288ebd35d9e8268516e3d34cd147bf2d3686a1/index.html'
ARG DOWNLOAD_DIR

WORKDIR ${DOWNLOAD_DIR}

RUN curl -sSLo ${DOWNLOAD_DIR}/index.html ${INDEX} && \
    if [ "$(uname -m)" = "x86_64" ]; then \
      curl -sSLo ${DOWNLOAD_DIR}/dumb-init ${DUMB_INIT}; \
    elif [ "$(uname -m)" = "aarch64" ]; then \
      curl -sSLo ${DOWNLOAD_DIR}/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_aarch64; \
    elif [ "$(uname -m)" = "arm64" ]; then \
      curl -sSLo ${DOWNLOAD_DIR}/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_arm64.deb; \
    elif [ "$(uname -m)" = "ppc64le" ]; then \
      curl -sSLo ${DOWNLOAD_DIR}/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_ppc64le; \
    elif [ "$(uname -m)" = "s390x" ]; then \
      curl -sSLo ${DOWNLOAD_DIR}/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_s390x; \
    else \
      echo "Unsupported architecture"; exit 1; \
    fi && \
    chmod +x ${DOWNLOAD_DIR}/dumb-init

FROM nginx:alpine

ARG DOWNLOAD_DIR

COPY --from=downloader ${DOWNLOAD_DIR}/index.html /usr/share/nginx/html/index.html
COPY --from=downloader ${DOWNLOAD_DIR}/dumb-init /usr/local/bin/dumb-init

RUN if [ "$(uname -m)" = "arm64" ]; then \
      apk add --no-cache dpkg; \
      mv ${DOWNLOAD_DIR}/dumb-init /tmp/dumb-init.deb \
      dpkg -i /tmp/dumb-init.deb; \
      rm -f /tmp/dumb-init.deb; \
    fi

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD ["/docker-entrypoint.sh", "--", "nginx", "-g", "daemon off;"]
