FROM alpine

RUN apk add --no-cache curl

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

WORKDIR /app

# See https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8
RUN curl -s https://api.github.com/repos/digitalocean/doctl/releases/latest \
curl -s https://api.github.com/repos/jgm/pandoc/releases/latest \
| grep "browser_download_url.*linux-amd64\.tar\.gz" \
| cut -d : -f 2,3 \
| tr -d \" \
| xargs curl -L \
| tar xz

ENTRYPOINT ["./doctl"]
