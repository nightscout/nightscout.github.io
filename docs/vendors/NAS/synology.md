# Nightscout in your Synology NAS

</br>

A valid solution for knowledgeable people, some projects here:

[https://t1d.dzienia.pl/nightscout_synology_tutorial/](https://t1d.dzienia.pl/nightscout_synology_tutorial/).

[https://github.com/vanelsberg/NightScoutSynology](https://github.com/vanelsberg/NightScoutSynology)

</br>

## Nightscout on Synology DS220+ - Complete Installation Guide

**Successfully Running Nightscout with LibreLink Bridge on Limited Hardware**

*A community guide based on real-world troubleshooting and successful deployment from Richard v.E.*

### Table of Contents

1. Overview
2. Hardware Limitations & Solutions
3. Prerequisites
4. Working Configuration

5. Installation Script
6. Common Pitfalls & Solutions
7. Verification Steps
8. Maintenance
9. Synology DSM Configuration

### 1. Overview

This guide documents a proven working configuration for running Nightscout with LibreLink Bridge on a Synology DS220+ NAS. After extensive troubleshooting, this setup has been running stable with real-time glucose updates every minute.

#### Key Achievements:

- MongoDB running stable on limited hardware
- LibreLink Bridge uploading data every minute
- No CPU compatibility errors
- Minimal resource usage
- Automatic recovery on failure

### 2. Hardware Limitations & Solutions

**DS220+ Specific Challenges:**

| Issue                  | Solution                                               |
| ---------------------- | ------------------------------------------------------ |
| No AVX CPU support     | Use MongoDB 3.6 (last version without AVX requirement) |
| No CPU CFS scheduler   | Remove all CPU limits from Docker configs              |
| Limited RAM            | Use memory limits only, optimize cache sizes           |
| Docker Compose version | Use version 3.3 with `mem_limit` instead of `deploy`   |

```{warning}
MongoDB 3.6 is below the version officially supported by Nightscout: 15.0.8 and later require MongoDB 5.0 or later, and MongoDB 5.0 requires a CPU with AVX. This guide is a community workaround for NAS models without AVX and may stop working with a future Nightscout release. If your NAS supports AVX, use MongoDB 5.0 or 6.0 instead.
```

**Critical Discovery:**

**DOES NOT WORK** on DS220+

```yaml
deploy:
  resources:
    limits:
      cpus: '0.5' # Kernel doesn't support this!
```

**WORKS** on DS220+

```yaml
mem_limit: 400m # Only memory limits work
```

### 3. Prerequisites

1. **Synology DS220+ with DSM 7.x**
2. **Docker & Docker Compose installed** via Package Center
3. P**ort 1337 available** for Nightscout
4. **LibreLink/LibreView account** with follower access
5. **Domain name** (optional, for HTTPS access)

### 4. Working Configuration

`docker-compose.yml`

```yaml
version: '3.3'

services:
# MongoDB 3.6 - CRITICAL: Don't use newer versions!
  mongodb:
    image: mongo:3.6
    container_name: nightscout-mongodb
    restart: unless-stopped
    environment:
      MONGO_INITDB_ROOT_USERNAME: admin
      MONGO_INITDB_ROOT_PASSWORD: [SECURE_PASSWORD_HERE]
    networks:
      - nightscout-net
    mem_limit: 400m
# Optimized for DS220+ limited resources
    command: mongod --smallfiles --oplogSize 128 --storageEngine wiredTiger --wiredTigerCacheSizeGB 0.25

# Nightscout Application
  nightscout:
    image: nightscout/cgm-remote-monitor:latest
    container_name: nightscout-app
    restart: unless-stopped
    depends_on:
      - mongodb
    environment:

# MongoDB Connection
      MONGODB_URI: mongodb://admin:[MONGO_PASSWORD]@mongodb:27017/nightscout?authSource=admin

# API Configuration - CRITICAL: Save this!
      API_SECRET: [YOUR_API_SECRET_HERE]

# Basic Settings
      NODE_ENV: production
      TZ: Europe/Amsterdam
      DISPLAY_UNITS: mmol # or mgdl

# Minimal plugins for performance
      ENABLE: careportal basal iob cob bwp rawbg direction

# Performance optimization for limited RAM
      NODE_OPTIONS: --max-old-space-size=256

# Required for local network access
      INSECURE_USE_HTTP: "true"

    ports:
      - "1337:1337"
    networks:
      - nightscout-net
    mem_limit: 300m

# LibreLink Bridge

  librelink:
    image: timoschlueter/nightscout-librelink-up:latest
    container_name: nightscout-librelink-up
    restart: unless-stopped
    depends_on:
      - nightscout
    environment:

# LibreView Credentials
      LINK_UP_USERNAME: "[YOUR_LIBREVIEW_EMAIL]"
      LINK_UP_PASSWORD: "[YOUR_LIBREVIEW_PASSWORD]"
      LINK_UP_REGION: "EU" # or US

# CRITICAL: NO http:// prefix!
      NIGHTSCOUT_URL: "nightscout-app:1337"

# CRITICAL: Must be SHA7 hash of APL_SECRET!
      NIGHTSCOUT_API_TOKEN: "[SHA1_HASH_OF_API_SECRET]"

      NIGHTSCOUT_DISABLE_HTTPS: "true"
      LOG_LEVEL: "info"

# Update interval in minutes
      LINK_UP_TIME_INTERVAL: "1"

    networks:
      - nightscout-net
    mem_limit: 128m

  networks:
    nightscout-net:
      driver: bridge
```

### 5. Installation Script

Save this as `install_nightscout.sh`:

```bash
#!/bin/bash

# Nightscout DS220+ Installer

# Tested and working configuration

BASE_DIR="/volume1/docker/nightscout"

echo "============================================"
echo "Nightscout DS220+ Installer"
echo "============================================"

# Check root
if [[ $EUID -ne 0 ]]; then
  echo "Please run as root: sudo $0"
  exit 1
fi

# Cleanup old installations

echo "Step 1: Cleaning up old containers..."
docker stop nightscout-app nightscout-mongodb nightscout-librelink-up 2>/dev/null
docker rm -f nightscout-app nightscout-mongodb nightscout-librelink-up 2>/dev/null
docker network rm nightscout-net 2>/dev/null

# Create directory
echo "Step 2: Creating directory structure..."
mkdir -p $BASE_DIR
cd $BASE_DIR

# IMPORTANT. Generate SHA1 hash of your API_SECRET
echo "Step 3: Generating API token hash..."
read -p “Enter your API_SECRET: " API_SECRET
APILHASH=$(echo -n "$API_SECRET" | shalsum | cut -d' ' -f1)
echo "SHA1 hash: $API_HASH"
echo "Save this hash for docker-compose.yml!"

# Create docker-compose.yml
echo "Step 4: Creating docker-compose.ymil..."
echo "Please edit docker-compose.yml and add:"
echo " - Your MongoDB password"
echo " - Your API_SECRET"
echo" - SHA1 hash: $API_HASH"
echo " - Your LibreView credentials"

# Start containers
echo "Step 5: Starting containers..."
docker-compose up -d


echo "Installation complete!"
echo "Wait 2-3 minutes, then test: http://localhost:1337"
```

### 6. Common Pitfalls & Solutions

**CRITICAL ISSUES THAT WILL BREAK YOUR SETUP:**

#### a) LibreLink URL Format

**WRONG**: Causes `getaddrinfo ENOTFOUND http` error.

```yaml
NIGHTSCOUT_URL: "http://nightscout-app:1337"
```

**CORRECT**: No protocol prefix

```yaml
NIGHTSCOUT_URL: "nightscout-app:1337"
```

#### b) API Token Format

yaml

**WRONG**: Plain text `API_SECRET`

```yaml
NIGHTSCOUT_API_TOKEN: "YourApiSecretHere"
```

**CORRECT**: SHA1 hash of `API_SECRET`

```yaml
NIGHTSCOUT_API_TOKEN: "756a5977a6d0b10d219a81c8b5d923a2fcf97f36"
```

To generate SHA1 hash:

```bash
echo -n "YourApiSecretHere" | shat1sum | cut -d' ' -f1
```

#### c) MongoDB Version

**WRONG**: MongoDB 5.0+ requires AVX support

```yaml
image: mongo:latest
```

**CORRECT**: MongoDB 3.6 works without AVX

```yaml
image: mongo:3.6
```

#### d) Docker Compose CPU Limits

**WRONG**: Causes `NanoCPUs cannot be set` error

```yaml
deploy:
  resources:
    limits:
      cpus: '0.5' # Kernel doesn't support this!
```

**CORRECT**: use `mem_linit` only

```yaml
mem_limit: 400m # Only memory limits work
```

### 7. Verification Steps

#### a) Check Container Status

```bash
docker ps --format "table {{.Names}}\t{{.Status}}"
```

All three containers should show "Up X minutes"

#### b) Test Nightscout API

```bash
# First get your API_SECRET hash
API_HASH=$(echo -n "YOUR_API_SECRET" | sha1sum | cut -d' ' -f1)

# Test your API
curl -H “api-secret: $API_HASH" http://localhost:1337/api/v1/entries.json
```

Should return JSON data or empty array `[]`

#### c) Check LibreLink Logs

```bash
docker logs nightscout-librelink-up --tail 10
```

Look for: `Upload of X measurements to Nightscout succeeded`

#### d) Monitor Resource Usage

```bash
docker stats --no-stream
```

Ensure memory usage stays under 80%

### 8. Maintenance

#### Daily Backup Script

Save as `/volume1/docker/nightscout/backup.sh`

```bash
#!/bin/bash

BACKUP_DIR="/volume1/docker/nightscout_backups"
DATE=$(date +%Y%m%d)

# Create backup directory
mkdir -p $BACKUP_DIR

# Export MongoDB data
docker exec nightscout-mongodb mongodump \
  --username admin \
  --password [YOUR_MONGO_PASSWORD] \
  --authenticationDatabase admin \
  --archive > $BACKUP_DIR/mongo_$DATE.archive

# Backup docker-compose
cp /volume1/docker/nightscout/docker-compose.yml $BACKUP_DIR/

echo “Backup completed: $BACKUP_DIR"
```

#### Useful Commands

Restart all services:

```bash
cd /volume1/docker/nightscout && docker-compose restart
```

View real-time logs:

```bash
docker logs -f nightscout-librelink-up
```

Check Nightscout web interface:

```bash
curl http://localhost:1337
```

Emergency reset:

```bash
docker-compose down && docker-compose up -d
```

### 8. Synology DSM Configuration

#### Reverse Proxy Setup (for HTTPS access)

1. Control Panel -> Application Portal -> Reverse Proxy

2. Create new rule:

- Source: HTTPS, your-domain.com, 443
- Destination: HTTP, localhost, 1337

3. Custom Header -> Create -> WebSocket

4. Save

#### SSL Certificate

1. Control Panel — Security — Certificate
2. Add — Get from Let's Encrypt
3. Enter your domain

4. Apply

#### Success Indicators

Your installation is successful when:

- All containers show "Up" status

- LibreLink logs show "Upload succeeded"

- API returns glucose data

- Web interface shows real-time glucose values

- Memory usage stays stable under 400MB per container


### Credits & Notes

This guide is based on extensive real-world troubleshooting on a production DS220+ system. The configuration has been tested and proven stable with:

- Continuous uptime of 30+ days

- Real-time updates every minute

- Automatic recovery from network interruptions

- Minimal resource usage


#### Special Notes:

- The DS220+ CPU limitations require specific workarounds
  MongoDB 3.6 is the last stable version for this hardware
- SHA1 hashing of `API_SECRET` is mandatory for LibreLink Bridge
  Never include `http://` in `NIGHTSCOUT_URL`

#### Troubleshooting Checklist

If things don't work:

1. ls MongoDB 3.6 (not newer)?

2. Is `NIGHTSCOUT_URL` without `http://`?
3. Is `API_TOKEN` a SHA1 hash?

4. Are all containers on same network?
5. No CPU limits in docker-compose?

6. Port 1337 not blocked?

*Last updated: September 2025 Tested on: Synology DS220+ with DSM 7.2 Working with: Nightscout 15.x, MongoDB 3.6, LibreLink Bridge 2.8*

</br>
