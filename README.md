# docker_unifi <a href='https://github.com/padhi-homelab/docker_unifi/actions?query=workflow%3A%22Docker+CI+Release%22'><img align='right' src='https://img.shields.io/github/workflow/status/padhi-homelab/docker_unifi/Docker%20CI%20Release?logo=github&logoWidth=24&style=flat-square'></img></a>

<a href='https://microbadger.com/images/padhihomelab/unifi'><img src='https://img.shields.io/microbadger/layers/padhihomelab/unifi/latest?logo=docker&logoWidth=24&style=for-the-badge'></img></a>
<a href='https://hub.docker.com/r/padhihomelab/unifi'><img src='https://img.shields.io/docker/image-size/padhihomelab/unifi/latest?label=size%20%5Blatest%5D&logo=docker&logoWidth=24&style=for-the-badge'></img></a>
<a href='https://hub.docker.com/r/padhihomelab/unifi'><img src='https://img.shields.io/docker/image-size/padhihomelab/unifi/testing?label=size%20%5Btesting%5D&logo=docker&logoWidth=24&style=for-the-badge'></img></a>

A multiarch [Unifi controller] Docker image, based on [Debian Stretch] (slim).

|        386         |       amd64        |          arm/v6          |          arm/v7          |       arm64        |         ppc64le          |          s390x           |
| :----------------: | :----------------: | :----------------------: | :----------------------: | :----------------: | :----------------------: | :----------------------: |
| :heavy_check_mark: | :heavy_check_mark: | :heavy_multiplication_x: | :heavy_multiplication_x: | :heavy_check_mark: | :heavy_multiplication_x: | :heavy_multiplication_x: |


## Usage

```
docker run --detach \
           -p 8443:8443 \
           -it padhihomelab/unifi
```

Runs Unifi controller on port 8443.

_<More details to be added soon>_

---

### Inspired by
  - https://github.com/jacobalberty/unifi-docker



[Debian Stretch]:   https://wiki.debian.org/DebianStretch
[gosu]:             https://github.com/tianon/gosu/
[MongoDB]:          https://www.mongodb.com/
[Unifi controller]: https://www.ui.com/download/unifi/

[thread]:           https://community.ui.com/questions/UniFi-Analytics-cannot-be-disabled-whatsoever/300f6fed-118e-4cd9-9a47-d399c53483f9?page=10