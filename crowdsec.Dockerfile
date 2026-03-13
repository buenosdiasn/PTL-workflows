FROM caddy:2.11-builder AS builder

RUN xcaddy build \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http \
    --with github.com/hslatman/caddy-crowdsec-bouncer/appsec \
    --with github.com/mholt/caddy-ratelimit \

FROM caddy:2.11

COPY --from=builder /usr/bin/caddy /usr/bin/caddy