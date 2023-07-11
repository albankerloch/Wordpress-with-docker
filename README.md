# Wordpress with Docker

An docker container with all the services needed for a Wordpress blog

Features :
- Nginx
- Mariadb database (id : alban, mdp : haha)
- PhpMyAdmin
- PHP
- Wordpress

## Installation

Launch the container with those commands on Linux : 


```bash
sudo docker build -t wpserver . && sudo docker run -it wpserver
```

on Windows : 
```bash
docker build -t wpserver .
```
then run your container on docker desktop (https://docs.docker.com/get-started/run-your-own-container/)

(docker needed : https://docs.docker.com/engine/install/debian/ 
or https://docs.docker.com/desktop/install/windows-install/)

## Usage

Open localhost on your web browser : 

Useful commands : 
```bash
sudo docker kill $(sudo  docker ps -q)
sudo docker rm $(sudo  docker ps -a -q)
sudo docker rm $(sudo  docker ps -a -q)
sudo docker volume rm $(docker volume ls -q)
sudo docker system df
```

#### Author : Alban Kerloc'h
#### Category: DevSecOps
#### Tag: Dockerfile,Docker
