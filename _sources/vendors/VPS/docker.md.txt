# Building Nightscout with Docker

</br>

```{tip}
<span style="font-size:larger;">The most complete guide for building your site step by step is the one used for [Oracle Cloud](https://www.dropbox.com/s/5twlqrndofqno0t/0-amber-oracle.pdf).  
If you use another hosting provider, skip Oracle specific instructions and follow the flow.</span>
```

</br>

Original documentation from [Jason](https://github.com/nightscout/nightscout-docker).  
More from [Andries](https://gist.github.com/Andries-Smit/daac75cd4c06af78cde68c5dec941705) and [Peter](https://github.com/peterleimbach/TestNightscoutDockerUbuntuServer22.04LTS) (traefik as below), [justmara](https://github.com/justmara/ns-setup) and [Ireneusz](https://github.com/ireneusz-ptak/ns-docker).

You can also use [Caddy as reverse proxy](https://github.com/Alderskog/nightscout-in-OCN).

If you want to deploy with CoreOS look [here](https://danielscrivano.com/blog/posts/nightscout/).

If you want to use Nightscout inside a Tailscale tailnet, with Docker Compose, look [here](https://gist.github.com/estradilua/c9a2302d58420177905915fdcd5aedca).

A comprehensive description of the yaml file for mongo and Nightscout setup [here](https://github.com/LostOnTheLine/Nightscout_Docker-Compose).

If you don't own a domain name, get a DDNS name now: see [here](/nightscout/dns).

</br>

## Update your system

Update your Ubuntu system (you should type this is a command every 3 or 6 months to keep it updated).

```bash
sudo apt update
sudo apt upgrade -y
sudo apt clean
```

You will see it's completed when the terminal stops scrolling text and you're returned to the prompt.

**If you see the following message: `*** System restart required ***` you will need to reboot**. Do not skip this step: reboot and wait a minute before opening again the console.  

```bash
sudo reboot
```

You must probably already have nano installed. If necessary:

```bash
sudo apt install nano -y
```

</br>

## Deploy a single instance

### Step 1 - Install Docker

*Note: instructions from the [vendor](https://docs.docker.com/engine/install/ubuntu/)*

a) Install keys

```bash
sudo apt-get -y install ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg --yes
```

b) Install Docker

```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

</br>

### Step 2 - Configure Nightscout

a) If you're running your VPS as root: Create a new  user. Else go to d)  
Don't try to run Nightscout as root, it will not work.  
**Replace `mainuser`** with a name of your choice, like your name, only lowercase letters.

```bash
sudo adduser mainuser
```

You need to invent a password for your new user.  
Confirm it then just hit `Enter` for the following lines, when done key `Y` then `Enter`.

 b) Make your user an administrator.

**Replace `mainuser`** with your new user name.

```bash
sudo usermod -aG sudo mainuser
```

c) Enable current user and make docker startup automatically.  
**Replace `mainuser`** with your new user name.

```bash
sudo groupadd docker
sudo usermod -aG docker mainuser
sudo systemctl enable docker
```

d) Login to the VPS using the account we just created.

!!!warning "Do not run Nightscout as root"  
    From now on use your Nightscout user.

**Replace `mainuser`** with your new user name.

```
sudo -u mainuser -s
```

Log out (`Ctrl-D` or `⌘-D`) or type `logout`, and log in with with your new user.

e) Customize your Docker Compose configuration file

You can use the default [docker-compose.yml](https://raw.githubusercontent.com/nightscout/cgm-remote-monitor/master/docker-compose.yml) file from the Nightscout repository or download [this one](/_static/docker-compose.yml).

There are few information you need to update:

- Which version of Nightscout you want to deploy.  
  You can find the list here: [https://hub.docker.com/r/nightscout/cgm-remote-monitor/tags](https://hub.docker.com/r/nightscout/cgm-remote-monitor/tags) and the tag is specified in the line below (example: `latest` is the latest release).

```
image: nightscout/cgm-remote-monitor:latest
```

- You need to specify your [time zone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List)

```
TZ: YOUR_TIMEZONE
```

- Your Nightscout site `API_SECRET` password.

```
API_SECRET: YOUR_API_SECRET
```

*Note: now you've also seen where your Nightscout variables are defined.*

For a self-hosted Docker Compose deployment, you can keep the secret out of the container environment by using `API_SECRET_FILE` instead. Create a local file containing only the secret, protect it with filesystem permissions, and configure it as a Compose secret:

```yaml
services:
  nightscout:
    environment:
      API_SECRET_FILE: /run/secrets/nightscout_api_secret
    secrets:
      - nightscout_api_secret

secrets:
  nightscout_api_secret:
    file: ./nightscout_api_secret.txt
```

Remove `API_SECRET` from the service when using this method. If both variables are present, `API_SECRET` takes precedence. Do not commit `nightscout_api_secret.txt` to Git or copy it into an image. See [`API_SECRET_FILE`](api-secret-file) for details.

- You need to update your Nightscout site URL (your DDNS name looking like `name.domain.tld`)

```
- 'traefik.http.routers.nightscout.rule=Host(`YOUR_PUBLIC_HOST_URL`)'
```

- You need to put a valid email too for important certificate emails (i.e. probably never)

```
- '--certificatesresolvers.le.acme.email=YOUR_EMAIL'
```

</br>

### Step 3 - Build and run Nightscout

To start your Nightscout:

```
sudo docker compose up -d
```

Or, if you want to start it in background (once everything is working as you won't see the log):

```
nohup sudo docker compose up -d &
```

To stop it (if you didn't select `always` restart for your containers):

```
sudo docker compose down
```

Note that you need to start it if you modify your `docker-compose.yml` configuration (to validate the changes).

</br>

## Update or downgrade

Edit your `docker-compose.yml` configuration and change the image to whichever you want in the [community maintained images](https://hub.docker.com/r/nightscout/cgm-remote-monitor/tags).

```{warning}
Back up your MongoDB data before changing the MongoDB image. A Nightscout image update and a MongoDB major-version upgrade are separate operations. Do not point a newer MongoDB major version at an existing data directory until you have followed MongoDB's supported upgrade path through each required major version.
```

If you're using `image: nightscout/cgm-remote-monitor:latest` and you want to upgrade it to latest release, don't change anything. You can update to `cgm-remote-monitor:latest_dev` or choose an older version like `cgm-remote-monitor:14.2.6`

```
sudo docker compose down
sudo docker compose pull
nohup sudo docker compose up -d &
```

</br>

</br>

## Deploy multiple instances

Hints from [justmara](https://github.com/justmara)

Portainer configuration used in docker-compose:

```
  portainer:
    image: portainer/portainer-ee:latest
    container_name: portainer
    restart: unless-stopped
    volumes:
      - ./portainer-data:/data
      - /var/run/docker.sock:/var/run/docker.sock
    labels:
      - 'traefik.enable=true'
      - 'traefik.http.routers.portainer.rule=Host(`portainer.<MYDOMAIN>`)'
      - 'traefik.http.routers.portainer.entrypoints=web'
      - 'traefik.http.routers.portainer.service=portainer-service'
      - 'traefik.http.services.portainer-service.loadbalancer.server.port=9000'
    ports:
      - "8000:8000"
      - "9443:9443"
      - "9000:9000"
    networks:
      - dia
```

Portainer custom template used to start new Nightscout instances:

```
version: '3.9'

x-ns-common-env: &ns-common-env
  NODE_ENV: production
  TZ: Europe/Moscow
  TIME_FORMAT: 24
  INSECURE_USE_HTTP: 'true'
  NIGHTSCOUT_HOSTNAME: '0.0.0.0'
  ENABLE: basal iob cob boluscalc cage sage iage bage pump openaps pushover food rawbg
  SHOW_FORECAST: openaps
  PUMP_FIELDS: clock reservoir
  DISPLAY_UNITS: mmol
  AUTH_DEFAULT_ROLES: denied

services:
  nightscout-{{ns-name}}:
    image: nightscout/cgm-remote-monitor:latest
    container_name: dia-ns-{{ns-name}}
    restart: always
    depends_on:
      - mongo
    labels:
      - 'traefik.enable=true'
      - 'traefik.http.routers.ns-{{ns-name}}.rule=Host(`{{ns-name}}.<MYDOMAIN>`)'
      - 'traefik.http.routers.ns-{{ns-name}}.entrypoints=web'
    environment:
      <<: *ns-common-env
      MONGO_CONNECTION: mongodb://mongo:27017/ns-{{ns-name}}
      API_SECRET: {{ns-secret}}
    networks:
      - dia

networks:
  dia:
    external: true
```

</br>

## Build you own Docker hub image

If you don't have one, create an account in [Docker Hub](https://hub.docker.com/). You will need [Docker](https://docs.docker.com/get-started/get-docker/) on the computer you will use to build your container.

1. Clone the `cgm-remote-monitor` project locally

2. Open a shell in the project root directory

   ```bash
   cd cgm-remote-monitor
   ```

3. Login  

   ```bash
   docker login 
   ```

    or (put your own credentials)

   ```bash
   docker login --username username --password xxxxx
   ```

4. Create the image (`tag` is your branch name)

   ```bash
   docker build . -t cgm-remote-monitor:tag
   ```

5. Get the image ID

   ```bash
   docker image ls
   ```

   You will see something like this:

   ```bash
   REPOSITORY           TAG       IMAGE ID       CREATED          SIZE
   cgm-remote-monitor   latest    81a5bfa0c365   50 seconds ago   263MB
   ```

6. Create an empty `cgm-remote-monitor` repository in Docker hub

7. Match your own Docker hub username with your Docker username (this is an example from above: you will not use `81a5bfa0c365`, `username` is your own, and so is the `tag`)

   ```bash
   docker image tag 81a5bfa0c365 username/cgm-remote-monitor:tag
   ```

8. Push the image to Docker hub

   ```bash
   docker push username/cgm-remote-monitor:tag
   ```

9. Your image is available as `username/cgm-remote-monitor:tag`

### Cleanup

After you've pulled many images in your VPS, you might want to save some disk space and cleanup.

```
docker image prune -a 
```
