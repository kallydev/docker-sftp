# Docker-SFTP

[![GitHub license](https://img.shields.io/github/license/kallydev/docker-sftp?style=flat-square)](LICENSE)
[![GitHub last commit](https://img.shields.io/github/last-commit/kallydev/docker-sftp?style=flat-square)](https://github.com/kallydev/docker-sftp/commits/master)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/kallydev/docker-sftp?style=flat-square)](https://hub.docker.com/r/kallydev/docker-sftp/builds)
[![Docker Pulls](https://img.shields.io/docker/pulls/kallydev/docker-sftp?style=flat-square&logo=docker)](https://hub.docker.com/r/kallydev/docker-sftp)

A SFTP service running in Docker.

## How to use

### 1. Install Docker

```bash
curl -sSL https://get.docker.com/ | sh
```

### 2. Build image

- Pull from Docker Hub (**RECOMMEND**)

```bash
docker pull kallydev/docker-sftp:latest
```

- Pull from Github Packages (**Linux amd-64 only**)

```bash
docker pull docker.pkg.github.com/kallydev/docker-sftp/docker-sftp:1.0.0
```

- Build from source

```bash
git clone https://github.com/kallydev/docker-sftp && cd docker-sftp
docker build -t kallydev/docker-sftp:latest -t kallydev/docker-sftp:1.0.0 .
```

### 3. Create users.conf

```bash
vim config/users.conf

# username:password
# foobar:password
```

### 4. Run image

You can specify the port that the sftp service opens to the external network, for example `1022`.

```bash
docker run \
    -v /srv/sftp:/home \
    -v /home/root/docker-sftp/config/users.conf:/etc/sftp/users.conf \
    -p 1022:22 \
    -d kallydev/docker-sftp:latest
```

### 5. Connect to SFTP

If your server IP is `42.42.42.42` and the port of sftp service is `1022`.

```bash
sftp -P 1022 username@42.42.42.42
```

## License

Copyright (c) KallyDev. All rights reserved.

Licensed under the [MIT](LICENSE).
