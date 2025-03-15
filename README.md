# Default Backend

One-page HTML distroless docker container for default backend, useful as the default rule for any load balancer.

[![Docker Pulls](https://img.shields.io/docker/pulls/meysam81/default-backend)](https://hub.docker.com/r/meysam81/default-backend)
[![Docker Image Size](https://img.shields.io/docker/image-size/meysam81/default-backend?label=docker%20image%20size)](https://hub.docker.com/r/meysam81/default-backend)
[![Renovate](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://developer.mend.io/github/meysam81/default-backend)
[![Code Size](https://img.shields.io/github/languages/code-size/meysam81/default-backend)](https://github.com/meysam81/default-backend)
[![Repo Size](https://img.shields.io/github/repo-size/meysam81/default-backend)](https://github.com/meysam81/default-backend)
[![Language Count](https://img.shields.io/github/languages/count/meysam81/default-backend)](https://github.com/meysam81/default-backend)
[![Technical Debt](https://sonarcloud.io/api/project_badges/measure?project=meysam81_default-backend&metric=sqale_index)](https://sonarcloud.io/summary/new_code?id=meysam81_default-backend)
[![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=meysam81_default-backend&metric=reliability_rating)](https://sonarcloud.io/summary/new_code?id=meysam81_default-backend)
[![Duplicated Lines (%)](https://sonarcloud.io/api/project_badges/measure?project=meysam81_default-backend&metric=duplicated_lines_density)](https://sonarcloud.io/summary/new_code?id=meysam81_default-backend)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=meysam81_default-backend&metric=vulnerabilities)](https://sonarcloud.io/summary/new_code?id=meysam81_default-backend)
[![Bugs](https://sonarcloud.io/api/project_badges/measure?project=meysam81_default-backend&metric=bugs)](https://sonarcloud.io/summary/new_code?id=meysam81_default-backend)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=meysam81_default-backend&metric=security_rating)](https://sonarcloud.io/summary/new_code?id=meysam81_default-backend)
[![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=meysam81_default-backend&metric=sqale_rating)](https://sonarcloud.io/summary/new_code?id=meysam81_default-backend)
[![Code Smells](https://sonarcloud.io/api/project_badges/measure?project=meysam81_default-backend&metric=code_smells)](https://sonarcloud.io/summary/new_code?id=meysam81_default-backend)
[![Lines of Code](https://sonarcloud.io/api/project_badges/measure?project=meysam81_default-backend&metric=ncloc)](https://sonarcloud.io/summary/new_code?id=meysam81_default-backend)

## Overview

A lightweight, security-focused 404 page served from a distroless container,
perfect for use as a default backend in load balancers and Kubernetes ingress
controllers.

Features dark mode support and responsive design while maintaining minimal
footprint.

## Features

- 🌓 Automatic dark/light mode based on system preferences
- 📱 Fully responsive design
- 🔒 Distroless container for minimal attack surface
- 🚀 Extremely lightweight (~2MB image size)
- 🎨 Clean, modern UI
- ⚡ Zero dependencies
- 🌐 System font stack for optimal performance

## Quick Start

```bash
docker run -dp 8000:8000 --name default-backend \
  ghcr.io/meysam81/default-backend
```

Then visit http://localhost:8000

## Usage with Load Balancers

### Nginx

```nginx
server {
    listen 80 default_server;
    server_name _;

    location / {
        proxy_pass http://localhost:8000;
    }
}
```

### Kubernetes Ingress

There's an officially supported Kustomization stack at the following URL:

<https://github.com/meysam81/kustomizations/tree/main/default-backend>

## Security

- Built on Google's distroless container
- No shell access
- Minimal base image
- No external dependencies
- Regular security updates

## Development

To modify the page:

1. Edit the `public/index.html` file
2. Build the container:

```bash
docker build -t default-backend .
```

## License

Apache 2.0, see [LICENSE](LICENSE).

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Support

- 🐛 [Report a bug](https://github.com/meysam81/default-backend/issues)
- 💡 [Request a feature](https://github.com/meysam81/default-backend/issues)

## Visual

The page looks like below:

![Index Page!](./docs/static/index.png)
