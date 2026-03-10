FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/fabriziosalmi/caddy-waf

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
