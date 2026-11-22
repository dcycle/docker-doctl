
FROM alpine:latest

RUN apk add --no-cache curl tar gzip jq

RUN mkdir -p /lib64 \
    && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

WORKDIR /app

# Install doctl
RUN DOCTL_URL=$(curl -fsSL https://api.github.com/repos/digitalocean/doctl/releases/latest \
    | jq -r '.assets[] | select(.name | test("linux-amd64.tar.gz$")) | .browser_download_url' \
    | head -n 1) \
    && curl -fsSL "$DOCTL_URL" -o /tmp/doctl.tar.gz \
    && tar -xzf /tmp/doctl.tar.gz -C /usr/local/bin \
    && rm /tmp/doctl.tar.gz

# Install pandoc
RUN PANDOC_URL=$(curl -fsSL https://api.github.com/repos/jgm/pandoc/releases/latest \
    | jq -r '.assets[] | select(.name | test("linux-amd64.tar.gz$")) | .browser_download_url' \
    | head -n 1) \
    && curl -fsSL "$PANDOC_URL" -o /tmp/pandoc.tar.gz \
    && mkdir -p /tmp/pandoc \
    && tar -xzf /tmp/pandoc.tar.gz -C /tmp/pandoc \
    && cp /tmp/pandoc/pandoc-*/bin/pandoc /usr/local/bin/ \
    && rm -rf /tmp/pandoc /tmp/pandoc.tar.gz

ENTRYPOINT ["doctl"]
