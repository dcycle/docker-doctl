**2021-03-19: this project is no longer maintained**

Interact with DigitalOcean using [doctl](https://github.com/digitalocean/doctl).

For example:

    MYDOTOKEN=put-your-digitalocean-api-token-here
    docker run --rm -e DIGITALOCEAN_ACCESS_TOKEN="$MYDOTOKEN" dcycle/doctl:1 --help
    docker run --rm -e DIGITALOCEAN_ACCESS_TOKEN="$MYDOTOKEN" dcycle/doctl:1 compute droplet list --output=json

Resources
-----

* [this project on the Docker Hub](https://hub.docker.com/r/dcycle/doctl/).
* [doctl documentation](https://www.digitalocean.com/community/tutorials/how-to-use-doctl-the-official-digitalocean-command-line-client)
