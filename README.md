# Default Backend

[![Code Size](https://img.shields.io/github/languages/code-size/meysam81/default-backend)](https://github.com/meysam81/default-backend)
[![Repo Size](https://img.shields.io/github/repo-size/meysam81/default-backend)](https://github.com/meysam81/default-backend)
[![Language Count](https://img.shields.io/github/languages/count/meysam81/default-backend)](https://github.com/meysam81/default-backend)
[![Docker pulls](https://img.shields.io/docker/pulls/meysam81/default-backend)](https://hub.docker.com/r/meysam81/default-backend)
[![Technical Debt](https://sonarcloud.io/api/project_badges/measure?project=meysam81_default-backend&metric=sqale_index)](https://sonarcloud.io/summary/new_code?id=meysam81_default-backend)
[![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=meysam81_default-backend&metric=reliability_rating)](https://sonarcloud.io/summary/new_code?id=meysam81_default-backend)
[![Duplicated Lines (%)](https://sonarcloud.io/api/project_badges/measure?project=meysam81_default-backend&metric=duplicated_lines_density)](https://sonarcloud.io/summary/new_code?id=meysam81_default-backend)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=meysam81_default-backend&metric=vulnerabilities)](https://sonarcloud.io/summary/new_code?id=meysam81_default-backend)
[![Bugs](https://sonarcloud.io/api/project_badges/measure?project=meysam81_default-backend&metric=bugs)](https://sonarcloud.io/summary/new_code?id=meysam81_default-backend)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=meysam81_default-backend&metric=security_rating)](https://sonarcloud.io/summary/new_code?id=meysam81_default-backend)
[![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=meysam81_default-backend&metric=sqale_rating)](https://sonarcloud.io/summary/new_code?id=meysam81_default-backend)
[![Code Smells](https://sonarcloud.io/api/project_badges/measure?project=meysam81_default-backend&metric=code_smells)](https://sonarcloud.io/summary/new_code?id=meysam81_default-backend)
[![Lines of Code](https://sonarcloud.io/api/project_badges/measure?project=meysam81_default-backend&metric=ncloc)](https://sonarcloud.io/summary/new_code?id=meysam81_default-backend)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Default Backend](#default-backend)
  - [Overview](#overview)
  - [How to Run?](#how-to-run)
  - [Visual](#visual)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Overview

This is a simple one-page HTML docker image repository that will serve as the
default backend, usually useful for the default rule of any load balancer.

## How to Run?

```bash
docker run -d -p 8080:80 --name default-backend meysam81/default-backend
```

## Visual

The page looks like below:

![Index Page!](./docs/static/index.png)
