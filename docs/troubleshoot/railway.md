# Troubleshoot Railway

</br>

## Nothing here

</br>

```{warning}
The free plan has been removed Jul 3rd for new users and Aug 1st for existing users.
```

</br>

It has been running fine for the first 200/500 hours and now it's gone. Even the project disappeared in Railway.

<img src="/vendors/railway/img/RailwayT12.png" width="300px" />

This is usually because you need a Developer plan to run your Nightscout app in Railway.

</br>

## Restart your app

a) Open the [Railway Dashboard](https://railway.app/dashboard) and select your project then your app.

<img src="/vendors/railway/img/RailwayT13.png" width="400px" />

</br>

b) In your `web` deployments select the current one (top of the list) and in the three dots menu on the right, `Restart`.

<img src="/vendors/railway/img/RailwayT14.png" width="600px" />

</br>

b) Confirm Restart. Wait a moment and check your Nightscout site state clicking the URL.  
If your site crashes again shortly after, verify your [database is not full](/troubleshoot/atlas.md#database-full) if you use MongoDB Atlas.

<img src="/vendors/railway/img/RailwayT15.png" width="400px" />

</br>

## Reconnect GitHub to your project

a) Open [Railway](https://railway.app) and click `login`. Login with GitHub.

<img src="/vendors/railway/img/Railway00.png" width="700px" />

<img src="/vendors/railway/img/Railway01.png" width="400px" />

</br>

b) Select your Nightscout project.

<img src="/vendors/railway/img/RailwayM15.png" width="600px" />

</br>

c) Select your web app.

<img src="/vendors/railway/img/RailwayM16.png" width="300px" />

</br>

d) Select `Settings` and scroll down to `Service`.  
Disconnect your `Source Repo` with the cross at the end of the line.

<img src="/vendors/railway/img/RailwayT01.png" width="600px" />

</br>

e) Confirm `Disconnect`.

<img src="/vendors/railway/img/RailwayT02.png" width="400px" />

</br>

f) Select `Connect Repo`.

<img src="/vendors/railway/img/RailwayT03.png" width="500px" />

You should be able to select your GitHub `cgm-remote-monitor` repository.  
You have now successfully reconnected your GitHub project to Railway.  
If your GitHub repository `cgm-remote-monitor` was changed (updated for example), your Railway app will automatically redeploy.

<img src="/vendors/railway/img/RailwayM03.png" width="500px" />

If you don't see the picture above: continue below.

</br>

g) If you redeployed (deleted and recreated) `cgm-remote-monitor` in GitHub select `Configure GitHub app`.  

<img src="/vendors/railway/img/RailwayM02.png" width="500px" />

</br>

h) Select your GitHub account.

<img src="/vendors/railway/img/RailwayT04.png" width="500px" />

</br>

i) Click `Only Select repositories` and from the `Select Repositories button` choose your `cgm-remote-monitor` Nightscout project. Click then `Install & Authorize`.

<img src="/vendors/railway/img/Railway08.png" width="500px" />

You have now successfully reconnected your GitHub project to Railway.  
If your GitHub repository `cgm-remote-monitor` was changed (updated for example), your Railway app will automatically redeploy.

</br>

## Cleanup

After several deployment attempts your Railway account might show more than one app. Since there is a 5$ limit to hobby plan before increased billing, depending on how you use it, it is important to make sure you don't have useless apps wasting CPU time and memory.

Open [Railway](https://railway.app) and click `login`. Login with GitHub.

<img src="/vendors/railway/img/Railway00.png" width="600px" />

</br>

If you see more than one (or two if you have a local database) projects on your dashboard, you should delete those unused.

<img src="/vendors/railway/img/RailwayT05.png" width="800px" />

</br>

### Empty projects

You can safely delete empty projects (in red in the picture above).

Select your project then click on `Settings`.

<img src="/vendors/railway/img/RailwayT06.png" width="600px" />

</br>

Click on `Danger`.

<img src="/vendors/railway/img/RailwayT07.png" width="300px" />

</br>

Then `Delete project`.

<img src="/vendors/railway/img/RailwayT08.png" width="500px" />

</br>

Copy and paste the project name in the box below and click `Delete`.

<img src="/vendors/railway/img/RailwayT09.png" width="500px" />

</br>

### Databases

Before deleting a database you need to check it's empty.

Click twice on the database project and select `Data`.

This example below is not an empty database. You need to check it's not being used by Nightscout before deleting it.  
You can see data inside: `profile`, `devicestatus`, etc...

<img src="/vendors/railway/img/RailwayT10.png" width="600px" />

</br>

This example below is empty, you can safely delete it (like shown above for an empty project).  
There is no data inside this database. When you pull down the `Database tab`, there is only `test` and it's empty.

<img src="/vendors/railway/img/RailwayT11.png" width="600px" />

</br>

## Backup your site variables

Having a copy of your variables is very important since some of them are vital to your site like MONGODB_URI and your access to it like API_SECRET.

a) Open your [Railway](https://railway.app/dashboard) dashboard and select your Nightscout project.

<img src="/vendors/railway/img/RailwayM15.png" width="400px" />

</br>

c) Select your web app and click on `Variables`.

<img src="/vendors/railway/img/RailwayM17.png" width="400px" />

</br>

e) Click on `RAW Editor` top right

<img src="/vendors/railway/img/Railway39.png" width="600px" />

</br>

f) Click on `Copy env` bottom left and paste all into a text editor.

<img src="/vendors/railway/img/Railway40.png" width="400px" />

</br>

```{warning}
Save this file in a safe place.</br>Call it `railway.env` as it's your Railway environment variables.
```

</br>

## Restore your site variables

You can use this method to restore Railway variables (see above how to backup), but also to restore them from [Northflank](/troubleshoot/northflank.md#backup-your-site-variables) or [Heroku](/troubleshoot/heroku.md#method-2-export) if migrating (follow the platform name link to see how to export them).

a) Open your [Railway](https://railway.app/dashboard) dashboard and select your Nightscout project.

<img src="/vendors/railway/img/RailwayM15.png" width="400px" />

</br>

c) Select your web app and click on `Variables`.

<img src="/vendors/railway/img/RailwayM17.png" width="400px" />

</br>

e) Click on `RAW Editor` top right

<img src="/vendors/railway/img/Railway39.png" width="600px" />

</br>

f) Delete all contents, open your backup file (the .env you generated when doing backup) and copy/paste all in the raw editor area. Click `Update variables` bottom right.

<img src="/vendors/railway/img/Railway40.png" width="400px" />

</br>

g) If you see the message `Apply _ changes` top left, click the `Deploy` button and wait for your site to update.

<img src="/vendors/railway/img/RailwayD06.png" width="600px" />

</br>
