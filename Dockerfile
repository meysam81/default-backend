FROM ghcr.io/static-web-server/static-web-server:2

ENV SERVER_PORT=8000 \
    SERVER_ERROR_PAGE_404=index.html \
    SERVER_FALLBACK_PAGE=index.html \
    SERVER_COMPRESSION_LEVEL=fastest \
    SERVER_LOG_REMOTE_ADDRESS=true \
    SERVER_HEALTH=true

COPY public/index.html /public
