FROM curlimages/curl:latest AS entrypoint

USER root

RUN if [ "$(uname -m)" = "x86_64" ]; then \
      curl -sSLo /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64; \
    elif [ "$(uname -m)" = "aarch64" ]; then \
      curl -sSLo /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_aarch64; \
    elif [ "$(uname -m)" = "arm64" ]; then \
      curl -sSLo /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_arm64.deb; \
    elif [ "$(uname -m)" = "ppc64le" ]; then \
      curl -sSLo /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_ppc64le; \
    elif [ "$(uname -m)" = "s390x" ]; then \
      curl -sSLo /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_s390x; \
    else \
      echo "Unsupported architecture: $(uname -m)"; exit 1; \
    fi && \
    chmod +x /usr/local/bin/dumb-init

FROM nginx:alpine

COPY index.html /usr/share/nginx/html/index.html
COPY --from=entrypoint /usr/local/bin/dumb-init /usr/local/bin/dumb-init

RUN if [ "$(uname -m)" = "arm64" ]; then \
      apk add --no-cache dpkg; \
      mv /usr/local/bin/dumb-init /tmp/dumb-init.deb \
      dpkg -i /tmp/dumb-init.deb; \
      rm -f /tmp/dumb-init.deb; \
    fi

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD ["/docker-entrypoint.sh", "--", "nginx", "-g", "daemon off;"]
