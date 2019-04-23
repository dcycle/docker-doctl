set -e
docker pull alpine
docker pull dcycle/doctl:1
docker build -t local-dcycle-doctl-image .

docker run -v $(pwd)/example:/app/code dcycle/doctl:1 --help
docker run -v $(pwd)/example:/app/code local-dcycle-doctl-image:1 --help
