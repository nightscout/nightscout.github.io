# Building Nightscout with Docker

</br>

```{tip}
<span style="font-size:larger;">The most complete guide for building your site step by step is the one used for [Oracle Cloud](https://www.dropbox.com/s/5twlqrndofqno0t/0-amber-oracle.pdf).  
If you use another hosting provider, skip Oracle specific instructions and follow the flow.</span>
```

</br>

Original documentation from [Jason](https://github.com/nightscout/nightscout-docker).  
More from [Andries](https://gist.github.com/Andries-Smit/daac75cd4c06af78cde68c5dec941705) and [Peter](https://github.com/peterleimbach/TestNightscoutDockerUbuntuServer22.04LTS) (traefik as below), [justmara](https://github.com/justmara/ns-setup) and [Ireneusz](https://github.com/ireneusz-ptak/ns-docker).

If you want to deploy with CoreOS look [here](https://danielscrivano.com/blog/posts/nightscout/).

A comprehensive description of the yaml file for mongo and Nightscout setup [here](https://github.com/LostOnTheLine/Nightscout_Docker-Compose).

If you don't own a domain name, get a DDNS name now: see [here](/nightscout/dns).

You can also use [Caddy as reverse proxy](https://github.com/Alderskog/nightscout-in-OCN).

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

If you're using `image: nightscout/cgm-remote-monitor:latest` and you want to upgrade it to latest release, don't change anything. You can update to `cgm-remote-monitor:latest_dev` or choose an older version like `cgm-remote-monitor:14.2.6`

```
sudo docker compose down
sudo docker compose pull
nohup sudo docker compose up -d &
```

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

