# Railway Troubleshooting

</br>

## Reconnect GitHub to your project

a) Open [Railway](https://railway.app) and click `login`. Login with GitHub.

<img src="../../../vendors/railway/img/Railway00.png" style="zoom:80%;" />

<img src="../../../vendors/railway/img/Railway01.png" style="zoom:80%;" />

</br>

b) Select your Nightscout project.

<img src="../../../vendors/railway/img/RailwayM15.png" style="zoom:80%;" />

</br>

c) Select your web app.

<img src="../../../vendors/railway/img/RailwayM16.png" style="zoom:80%;" />

</br>

d) Select `Settings` and scroll down to `Service`.  
Disconnect your `Source Repo` with the cross at the end of the line.

<img src="../../../vendors/railway/img/RailwayT01.png" style="zoom:80%;" />

</br>

e) Confirm `Disconnect`.

<img src="../../../vendors/railway/img/RailwayT02.png" style="zoom:80%;" />

</br>

f) Select `Connect Repo`.

<img src="../../../vendors/railway/img/RailwayT03.png" style="zoom:80%;" />

You should be able to select your GitHub `cgm-remote-monitor` repository.  
You have now successfully reconnected your GitHub project to Railway.  
If your GitHub repository `cgm-remote-monitor` was changed (updated for example), your Railway app will automatically redeploy.

<img src="../../../vendors/railway/img/RailwayM03.png" style="zoom:80%;" />

If you don't see the picture above: continue below.

</br>

g) If you redeployed (deleted and recreated) `cgm-remote-monitor` in GitHub select `Configure GitHub app`.  

<img src="../../../vendors/railway/img/RailwayM02.png" style="zoom:80%;" />

</br>

h) Select your GitHub account.

<img src="../../../vendors/railway/img/RailwayT04.png" style="zoom:80%;" />

</br>

i) Click `Only Select repositories` and from the `Select Repositories button` choose your `cgm-remote-monitor` Nightscout project. Click then `Install & Authorize`.

<img src="../../../vendors/railway/img/Railway08.png" style="zoom:80%;" />

You have now successfully reconnected your GitHub project to Railway.  
If your GitHub repository `cgm-remote-monitor` was changed (updated for example), your Railway app will automatically redeploy.

</br>

## Cleanup

After several deployment attempts your Railway account might show more than one app. Since there is a 5$ limit before billing, depending on how you use it, it is important to make sure you don't have useless apps wasting CPU time and memory.

Open [Railway](https://railway.app) and click `login`. Login with GitHub.

<img src="../../../vendors/railway/img/Railway00.png" style="zoom:80%;" />

</br>

If you see more than one (or two if you have a local database) projects on your dashboard, you should delete those unused.

<img src="../../../vendors/railway/img/RailwayT05.png" style="zoom:80%;" />

</br>

#### Empty projects

You can safely delete empty projects (in red in the picture above).

Select your project then click on `Settings`.

<img src="../../../vendors/railway/img/RailwayT06.png" style="zoom:80%;" />

</br>

Click on `Danger`.

<img src="../../../vendors/railway/img/RailwayT07.png" style="zoom:80%;" />

</br>

Then `Delete project`.

<img src="../../../vendors/railway/img/RailwayT08.png" style="zoom:80%;" />

</br>

Copy and paste the project name in the box below and click `Delete`.

<img src="../../../vendors/railway/img/RailwayT09.png" style="zoom:80%;" />

</br>

#### Databases

Before deleting a database you need to check it's empty.

Click twice on the database project and select `Data`.

This example below is not an empty database. You need to check it's not being used by Nightscout before deleting it.  
You can see data inside: `profile`, `devicestatus`, etc...

<img src="../../../vendors/railway/img/RailwayT10.png" style="zoom:80%;" />

</br>

This example below is empty, you can safely delete it (like shown above for an empty project).  
There is no data inside this database. When you pull down the `Database tab`, there is only `test` and it's empty.

<img src="../../../vendors/railway/img/RailwayT11.png" style="zoom:80%;" />

</br>
