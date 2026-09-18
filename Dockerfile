FROM ghcr.io/static-web-server/static-web-server:2

EXPOSE 8000

# No fallback page: static-web-server serves a fallback with HTTP 200, which
# turns a catch-all backend into a "found" for every scanner probing invented
# hostnames and dotfiles. Nothing is published at the root, so every path,
# including /, gets this page with a real 404. /health stays 200 for probes.
ENV SERVER_PORT=8000 \
    SERVER_LOG_LEVEL=info \
    SERVER_ERROR_PAGE_404=/public/404.html \
    SERVER_COMPRESSION_LEVEL=fastest \
    SERVER_LOG_REMOTE_ADDRESS=true \
    SERVER_HEALTH=true

COPY public/index.html /public/404.html
