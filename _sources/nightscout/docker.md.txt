---
orphan: true
---

<head>
  <meta http-equiv="Refresh" content="0; URL=https://nightscout.github.io/vendors/VPS/docker/" />
</head>
Build your own Docker hub image

1. Clone the cgm-remote-monitor project locally

2. Open a shell in the project root directory (cd cgm-remote-monitor)

3. Login  
   docker login --username username --password xxxxx

4. Create the image

   docker build . -t cgm-remote-monitor

5. Get the image ID

   docker image ls

   REPOSITORY           TAG       IMAGE ID       CREATED          SIZE
   cgm-remote-monitor   latest    81a5bfa0c365   50 seconds ago   263MB

6. Create an empty cgm-remote-monitor repository in Docker hub

7. Match your own Docker hub username with your Docker username

   docker image tag 81a5bfa0c365 username/cgm-remote-monitor

8. Push the image to Docker hub

   docker push username/cgm-remote-monitor

9. Your image is available as username/cgm-remote-monitor





cleanup:

```
docker image prune -a 
```
