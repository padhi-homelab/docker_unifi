# docker_unifi <a href='https://github.com/padhi-homelab/docker_unifi/actions?query=workflow%3A%22Docker+CI+Release%22'><img align='right' src='https://img.shields.io/github/workflow/status/padhi-homelab/docker_unifi/Docker%20CI%20Release?logo=github&logoWidth=24&style=flat-square'></img></a>

<a href='https://hub.docker.com/r/padhihomelab/unifi'><img src='https://img.shields.io/docker/image-size/padhihomelab/unifi/latest?logo=docker&logoWidth=24&style=for-the-badge'></img></a> <a href='https://microbadger.com/images/padhihomelab/unifi'><img src='https://img.shields.io/microbadger/layers/padhihomelab/unifi/latest?logo=docker&logoWidth=24&style=for-the-badge'></img></a>

A multiarch [Unifi controller] Docker image, based on [Debian Stretch] (slim).

<table>
  <thead>
    <tr>
      <th>:heavy_check_mark: i386</th>
      <th>:heavy_check_mark: amd64</th>
      <th>:heavy_multiplication_x: arm</th>
      <th>:heavy_multiplication_x: armhf</th>
      <th>:heavy_check_mark: aarch64</th>
      <th>:heavy_multiplication_x: ppc64le</th>
    <tr>
  </thead>
</table>

### Credits

#### https://github.com/jacobalberty/unifi-docker
  - My [Dockerfile](Dockerfile) and [entrypoint.sh](root/entrypoint.sh) are largely based on
    the ones available in this repo.
  - I removed the local [MongoDB] instance
    and turned off telemetry analytics ([I hope?!][thread]).
  - I merged their docker-build.sh into the Dockerfile and cleaned it up.

### TODO
- Switch to Alpine Linux + glibc?



[Debian Stretch]:   https://wiki.debian.org/DebianStretch
[gosu]:             https://github.com/tianon/gosu/
[MongoDB]:          https://www.mongodb.com/
[Unifi controller]: https://www.ui.com/download/unifi/

[thread]:           https://community.ui.com/questions/UniFi-Analytics-cannot-be-disabled-whatsoever/300f6fed-118e-4cd9-9a47-d399c53483f9?page=10