---
orphan: true
---

# Troubleshoot Northflank

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