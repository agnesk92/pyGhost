# PyGhost

## Contribution

### Environment

Set up the env for docker.
```bash 
# Run the Docker daemon
sudo systemctl start docker

# Create the docker group and add yourself - you'll need to re-login for this to take effect
sudo groupadd docker
sudo usermod -aG docker $USER 
```

#### Ubuntu

```bash 
# Build dockerfile
docker build . -t pyghost-ubuntu:v1.0

# Depending on the OS you are using sh or bash ..
docker run -it pyghost-ubuntu:v1.0 sh
docker run -it pyghost-ubuntu:v1.0 bash

# Linux setups - might need for host display access
# If needed for display env var: ip route list | grep default
xhost +local:docker

# For GUI apps, use the host's X11 server and DISPLAY
# https://stackoverflow.com/questions/28392949/running-chromium-inside-docker-gtk-cannot-open-display-0
docker run --env DISPLAY=unix$DISPLAY --volume $XAUTH:/root/.Xauthority --volume /tmp/.X11-unix:/tmp/.X11-unix --rm -it pyghost-ubuntu:v1.0 bash

docker exec -it pyghost-ubuntu:v1.0 bash
```
