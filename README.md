# Sentrifugo
Sentrifugo offers HR resource modules with exceptional features and an intuitive interface.

## Docker Environment

You can use a Dockerfile to create Docker image and run Sentrifugo in Docker container.
The following command will help you to run two Docker Containers:
 - Apache2 HTTP Web Server on port 80 inside Docker container:

```sh
docker run --name sentrifugo -p 80:80 -d andriykoval/sentrifugo
```

 - MariaDB Database Server on port 3306 inside Docker container:

```sh
docker run --name senrifugo_db -e MYSQL_DATABASE='sentrifugo' -e MYSQL_USER='sentrifugo' -e MYSQL_PASSWORD='Sentrifugo' -e MYSQL_ALLOW_EMPTY_PASSWORD='no' -e MYSQL_ROOT_PASSWORD='mysql' -p 3306:3306 -d mariadb:10.0.34
```

### Docker Compose
You can run whole Docker environment via Docker compose:

```sh
version: '3.4'

services:

  sentrifugo:
    build: .
    image: sentrifugo:latest
    container_name: sentrifugo
    ports:
      - "80:80"

  sentrifugo_db:
    image: mariadb:10.0.34
    container_name: sentrifugo_db
    restart: always
    environment:
      - MYSQL_DATABASE=sentrifugo
      - MYSQL_USER=sentrifugo
      - MYSQL_PASSWORD=Sentrifugo
      - MYSQL_ALLOW_EMPTY_PASSWORD=no
      - MYSQL_ROOT_PASSWORD=mysql
    ports:
      - "3306:3306"
```

