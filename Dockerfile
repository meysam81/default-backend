FROM ghcr.io/static-web-server/static-web-server:2@sha256:ccf2d666ffe5f8ef2ec96bc40f07757605998c04b78f7d8fdb98a584dd4f5717

EXPOSE 8000

ENV SERVER_PORT=8000 \
    SERVER_LOG_LEVEL=info \
    SERVER_ERROR_PAGE_404=index.html \
    SERVER_FALLBACK_PAGE=index.html \
    SERVER_COMPRESSION_LEVEL=fastest \
    SERVER_LOG_REMOTE_ADDRESS=true \
    SERVER_HEALTH=true

COPY public/index.html /public
