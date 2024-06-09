---
orphan: true
---

# Troubleshoot Northflank

</br>

## Site doesn't open after build

`upstream connect error or disconnect/reset before headers. retried and the latest reset reason: remote connection failure, transport failure reason: delayed connect error: 111`

You probably need to wait until the deploy is finished. Refresh the page after 5 minutes.

</br>

## Restart

a) [Log into Northflank](https://app.northflank.com/) and select your Nightscout `project`, then its `service`.

<img src="/vendors/northflank/img/NorthflankT01.png" width="500px" />

</br>

b) Click `Rollout Restart` and confirm `Restart Service`.  
Wait until restart is complete with the cloud status `Running`.

<img src="/vendors/northflank/img/NorthflankT02.png" width="600px" />

</br>

If your site crashes again shortly after, verify your [database is not full](/troubleshoot/atlas.md#database-full) if you use MongoDB Atlas.

</br>