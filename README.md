# Docker PHP-FPM 8.2 & Nginx 1.24 on Alpine Linux, which is customised for Lavarel   
Example PHP-FPM 8.2 & Nginx 1.24 container image for Docker, built on [Alpine Linux](https://www.alpinelinux.org/).

Current Repository : https://github.com/pleungkh/php-nginx_4laravel
Source Repository: https://github.com/TrafeX/docker-php-nginx


* Built on the lightweight and secure Alpine Linux distribution
* Multi-platform, supporting AMD4, ARMv6, ARMv7, ARM64
* Very small Docker image size (+/-40MB)
* Uses PHP 8.2 for the best performance, low CPU usage & memory footprint
* Optimized for 100 concurrent users
* Optimized to only use resources when there's traffic (by using PHP-FPM's `on-demand` process manager)
* The services Nginx, PHP-FPM and supervisord run under a non-privileged user (nobody) to make it more secure
* The logs of all the services are redirected to the output of the Docker container (visible with `docker logs -f <container name>`)
* Follows the KISS principle (Keep It Simple, Stupid) to make it easy to understand and adjust the image to your needs

[![Docker Pulls](https://img.shields.io/docker/pulls/trafex/php-nginx.svg)](https://hub.docker.com/r/trafex/php-nginx/)
![nginx 1.24](https://img.shields.io/badge/nginx-1.24-brightgreen.svg)
![php 8.2](https://img.shields.io/badge/php-8.2-brightgreen.svg)
![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)

## [![Trafex Consultancy](https://timdepater.com/logo/mini-logo.png)](https://timdepater.com?mtm_campaign=github)
I can help you with [Containerization, Kubernetes, Monitoring, Infrastructure as Code and other DevOps challenges](https://timdepater.com/?mtm_campaign=github).


## Goal of this project
The goal of this container image is to provide an example for running Nginx and PHP-FPM in a container which follows
the best practices and is easy to understand and modify to your needs.

## Usage


Build docker image from source,  create, start container  :

    cd ./php-nginx_4laravel
    docker build -t pleungkh/php-nginx .

Build create, start container  :
    docker create --name laravel.dv -p 80:8080 -v ~/laravel/myapp:/var/www/html pleungkh/php-nginx
    docker start laravel.dv
    # log into container
    docker exec -i -t laravel.dv ash 

Start the Docker container:

    docker run -p 80:8080 pleungkh/php-nginx

See the PHP info on http://localhost, or the static html page on http://localhost/test.html

Or mount your own Laravel project source code to be served by PHP-FPM & Nginx

    docker run -p 80:8080 -v ~/my-laravel-prj-path:/var/www/html pleungkh/php-nginx

## Configuration
In [config/](config/) you'll find the default configuration files for Nginx, PHP and PHP-FPM.
If you want to extend or customize that you can do so by mounting a configuration file in the correct folder;

Nginx configuration:

    docker run -v "`pwd`/nginx-server.conf:/etc/nginx/conf.d/server.conf" pleungkh/php-nginx

PHP configuration:

    docker run -v "`pwd`/php-setting.ini:/etc/php82/conf.d/settings.ini" pleungkh/php-nginx

PHP-FPM configuration:

    docker run -v "`pwd`/php-fpm-settings.conf:/etc/php82/php-fpm.d/server.conf" pleungkh/php-nginx

_Note; Because `-v` requires an absolute path I've added `pwd` in the example to return the absolute path to the current directory_

## Documentation and examples
To modify this container to your specific needs please see the following examples;

* [Adding xdebug support](docs/xdebug-support.md)
* [Adding composer](docs/composer-support.md)
* [Getting the real IP of the client behind a load balancer](docs/real-ip-behind-loadbalancer.md)
* [Sending e-mails](docs/sending-emails.md)
* [Quick Installation on PC/Mac](docs/quick_install.md)
