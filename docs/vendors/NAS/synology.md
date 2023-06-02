# Nightscout in your Synology NAS

</br>

Use a translator and have a look here too: [https://t1d.dzienia.pl/nightscout_synology_tutorial/](https://t1d.dzienia.pl/nightscout_synology_tutorial/)

</br>

```{warning}
Work in progress
```

This guide is written after the [Heroku&#39;s Next Chapter](https://blog.heroku.com/next-chapter "Heroku's Next Chapter") announcement of August 25, 2022. First, I want to put [Heroku](https://www.heroku.com/ "Heroku") in the spotlight. They have had a big contribution to the growth of our do-it-yourself community with their free tier for a long time. Many, many thanks!

The migration of our three Nightscout sites from [Heroku](https://www.heroku.com/ "Heroku") and [MongoDB Atlas](https://www.mongodb.com/atlas "MongoDB Atlas") to our Synology is a success. Performed a full data migration for having zero data loss, running multiple Nightscout instances, working URL's shared with our hospital, I'm syncing my girlfriends data to my xDrip+ follower, using a free Let's Encrypt certificate and managed to get rid of the NSClient "*xhr poll error*", also bought a PositiveSSL Domain Validation certificate for EUR 10 a/year just to see it work (all OK). 

It was a quite intense ride and therefore happy to share the learnings to help others. I will spend time to fill this page incrementally, because having a baby with a fun and busy job really limits your time.

## Disclaimer

Most people who own a Synology a pretty technical, this page is written for that audience. Self-hosting Nightscout on a Synology will be intense in patch management and maintenance, but also have some strong advantages. When you are not that technical, do not have the time to maintain all components or just want someone to do it for you, consider a [hosted Nightscout service](/index.md#nightscout-as-a-service)..

## Need help?

Before this guide is completely finished? Please use this [Facebook topic](https://www.facebook.com/groups/cgminthecloud/posts/5497953650325846/ "Facebook topic") in Facebook group [CGM in the Cloud](https://www.facebook.com/groups/cgminthecloud). I will monitor it and answer questions whenever possible.

### Initial documents

- [Nightscout on Synology + model, initially for the technically minded only](https://docs.google.com/document/d/1WWq6f_U2BSs3A_Ij312M5OmXCH-BaIxdC6FY3NenlzY/edit)

- [Export data MongoDB Atlas to MongoDB Synology-Docker](https://docs.google.com/document/d/1dHswtf6j4xmX0cwDUpUPJIAymSqQyaWnwocKpEkkA_A/)

- [Nightscout Synology Tutorial using SSH and Portainer](https://t1d-dzienia-pl.translate.goog/nightscout_synology_tutorial/?_x_tr_sl=nl&_x_tr_tl=en&_x_tr_hl=en-US&_x_tr_pto=op,wapp) as mentioned in [this Facebook comment](https://www.facebook.com/groups/cgminthecloud/posts/5497953650325846/?comment_id=5499298483524696). Definitely a good read, but a different implementation due to SSH and Portainer.

## Version history

See [history of this page on GitHub](https://github.com/nightscout/nightscout.github.io/commits/source/docs/vendors/synology "history of this page on GitHub") for information.

## Used components

For this solution, the components below are used.

### Services to migrate from

- [Heroku](https://www.heroku.com/ "Heroku")
- [MongoDB Atlas](https://www.mongodb.com/atlas "MongoDB Atlas")

### Hardware

- Hardware router at home
- Synology
- UPS Power supply for Synology
- Android smartphone for T1D patient
- Android smartphone for caregiver

### Software

- [AndroidAPS, most recent](https://androidaps.readthedocs.io/ "AndroidAPS, most recent") for T1D Patient
- [xDrip+, most recent](https://xdrip.readthedocs.io/ "xDrip+, most recent") for T1D Patient
- [xDrip+, most recent](https://xdrip.readthedocs.io/ "xDrip+, most recent") for caregiver
- Synology [DiskStation Manager, most recent](https://www.synology.com/nl-nl/dsm "DiskStation Manager, most recent")
- Docker container [mongo, v4.4.17](https://hub.docker.com/_/mongo "mongo 4.4.17")
- Docker container [mongo-express, latest](https://hub.docker.com/_/mongo-express "mongo-express, latest")
- Docker container [Nightscout, latest](https://hub.docker.com/r/nightscout/cgm-remote-monitor "Nightscout, latest")
- A Nightscout token to provide hospital access to reporting
  
## Visual Steps

![Concept of the visual steps](../img/Self host Nightscout v0.4.drawio.png "Concept of the visual steps")

## Detailed steps

Steps correspond to the numbering on the drawing.

### 1 - Checks
#### 1a - Prerequisites

### 2 - Setup domain
#### 2a - Free DDNS
#### 2b - Own domain

### 3. Installation Docker and containers
#### 3a. Install Docker
#### 3b. Install mongo
#### 3c. Install mongo-express
#### 3d. Install Nightscout

### 4. Network settings
#### 4a. Configure Synology firewall
#### 4b. Open hardware firewalls
#### 4c. Get SSL certificate
#### 4d. Configure reverse proxy
#### 4e. Check URL

### 5. (Heroku) Migration
#### 5a. Maintenance Mode
#### 5b. Data migration
#### 5c. AndroidAPS
##### 5c1. NSClient URL
##### 5c2. Check uploads
##### 5c3. Backup settings
#### 5d. xDrip+ T1D patient
##### 5d1. Nightscout Follow URL
##### 5d2. Check uploads
##### 5d3. Backup settings
#### 5e. xDrip+ caregivers
##### 5e1. Nightscout Follow URL
##### 5e2. Check processing
##### 5e3. Backup settings
#### 5f. Update caregivers (medical, personal, ...)
#### 5g. Check documentation
#### 5h. Schedule maintenance
#### 5i. Schedule clean-up check

### 6. Clean up
#### 6a. Heroku
#### 6b. MongoDB

### 7. Regular maintenance
#### 7a. Patching
##### 7a1. Hardware
##### 7a2. Software
##### 7a3. Lifecycle
#### 7b. 3-2-1 Back-up
#### 7c. Test environment
#### 7d. Costs
##### 7d1. Own domain
##### 7d2. Maintenance
##### 7d3. Power
