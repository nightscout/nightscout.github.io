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

## Backup your site variables

Having a copy of your variables is very important since some of them are vital to your site like MONGODB_URI and your access to it like API_SECRET.

Open [Northflank](https://app.northflank.com/login) and login with your username or with GitHub.

<img src="/vendors/northflank/img/Northflank30.png" width="400px" />

</br>

Select `Services ` then your Nightscout project.

<img src="/vendors/northflank/img/Northflank31.png" width="600px" />

</br>

Select `Environment` then `Env`.

<img src="/vendors/northflank/img/Northflank39.png" width="600px" />

</br>

Copy the contents of the `Environment variables` and paste it into a text editor.

<img src="/vendors/northflank/img/Northflank41.png" width="600px" />

</br>

```{warning}
Save this file in a safe place.</br>Call it `northflank.env` as it's your Northflank environment variables.
```

</br>

## Restore your site variables

You can use this method to restore Northflank variables (see above how to backup), but also to restore them from [Railway](/troubleshoot/railway.md#backup-your-site-variables) or [Heroku](/troubleshoot/heroku.md#method-2-export) if migrating (follow the platform name link to see how to export them).

Open [Northflank](https://app.northflank.com/login) and login with your username or with GitHub.

<img src="/vendors/northflank/img/Northflank30.png" width="400px" />

</br>

Select `Services ` then your Nightscout project.

<img src="/vendors/northflank/img/Northflank31.png" width="600px" />

</br>

Select `Environment` then `Env`.

<img src="/vendors/northflank/img/Northflank39.png" width="600px" />

</br>

Delete all contents, open your backup file (the .env you generated when doing backup) and copy/paste all in the editor area. Click `Update and restart` bottom right.

<img src="/vendors/northflank/img/Northflank41.png" width="600px" />

</br>