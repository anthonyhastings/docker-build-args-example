# Docker Build Args Example

## Introduction
![Demonstration](https://raw.githubusercontent.com/anthonyhastings/docker-build-args-example/master/images/docker_build_args_example.gif)

This repository showcases using [build arguments](https://docs.docker.com/compose/compose-file/#args) with Docker (via Docker Compose). Build arguments are variables only available during the building of an image, and are not available to the container itself whenever it runs. They manifest themselves and are consumed like environment variables would be. They can help tailor the image as required and are often used to supply tokens needed to pull dependencies into the image being built, without compromising/leaking those tokens to the container.

In this example, we supply a `REACT_VERSION` build argument to ensure that the `Dockerfile` pulls down the intended version of React. We then do some logging to showcase that the build argument isn't available as an environment variable, and that the version of React is indeed as intended.

## Instructions
This example assumes you already have `docker` and `docker-compose` installed. The steps are as follows:

1) Build the docker image and ensure that the build argument is specified as an environment variable in the CLI:
```shell
REACT_VERSION=15.4.1 docker-compose build
```

2) Start the container and verify the output is as expected (React has the correct version and there's no relevant environment variable):
```shell
docker-compose up
```

## Further Information
Some useful resources are listed below:
- [Docker ARG, ENV and .env - a Complete Guide](https://vsupalov.com/docker-arg-env-variable-guide/#arg-and-env-availability)
- [Arguments and variables in Docker](https://blog.manifold.co/arguments-and-variables-in-docker-94746642f64b)
