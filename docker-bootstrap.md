This is the [docker-bootstrap](https://github.com/McFateM/docker-bootstrap) config file for https://thecompassroseband.net.  My [docker-bootstrap Workflow](https://static.grinnell.edu/blogs/McFateM/posts/008-docker-bootstrap-workflow/) post describes the server setup too.

Run the following ONE time on the host...

```
NAME=compassrose
HOST=thecompassroseband.net
IMAGE="summittdweller/compassrose"
docker container run -d --name ${NAME} \
    --label traefik.backend=${NAME} \
    --label traefik.docker.network=opt_webgateway \
    --label "traefik.frontend.rule=Host:${HOST}" \
    --label traefik.port=80 \
    --label com.centurylinklabs.watchtower.enable=true \
    --network opt_webgateway \
    --restart always \
    ${IMAGE}
```
