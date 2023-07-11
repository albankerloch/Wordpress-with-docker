# Wordpress with Docker

An docker container with all the services needed for a Wordpress blog

Features :
- Nginx
- Mariadb database (id : alban, mdp : haha)
- PhpMyAdmin
- PHP
- Wordpress

## Installation

Launch the container with those commands : 


```bash
docker build -t wpserver. && docker run -it wpserver
```

(docker needed : https://docs.docker.com/engine/install/debian/)

## Usage

Open localhost on your web browser : 

#### Author : Alban Kerloc'h
#### Category: DevSecOps
#### Tag: Dockerfile,Docker