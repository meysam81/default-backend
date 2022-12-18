ARG DOWNLOAD_DIR='/downloads'

FROM curlimages/curl:latest AS downloader

USER root

ARG DUMB_INIT='https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64'
ARG INDEX='https://gist.githubusercontent.com/meysam81/07cda6ece739cfa41a3f842382c1b230/raw/49288ebd35d9e8268516e3d34cd147bf2d3686a1/index.html'
ARG DOWNLOAD_DIR

WORKDIR ${DOWNLOAD_DIR}

RUN curl -sSLo ${DOWNLOAD_DIR}/index.html ${INDEX} && \
    curl -sSLo ${DOWNLOAD_DIR}/dumb-init ${DUMB_INIT} && \
    chmod +x ${DOWNLOAD_DIR}/dumb-init

FROM nginx:alpine

ARG DOWNLOAD_DIR

COPY --from=downloader ${DOWNLOAD_DIR}/index.html /usr/share/nginx/html/index.html
COPY --from=downloader ${DOWNLOAD_DIR}/dumb-init /usr/local/bin/dumb-init

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD ["/docker-entrypoint.sh", "--", "nginx", "-g", "daemon off;"]
