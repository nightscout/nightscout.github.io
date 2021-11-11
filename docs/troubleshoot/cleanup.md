# Cleanup

After unsuccessful attempts you might want to cleanup the various accounts to avoid confusion.

If you're still trying to deploy your first Nightscout, ignore all data loss recommendations below.

If you have a large amount of CGM data, be extra cautious when performing Atlas cleanup.

</br>

## [Github](https://github.com/login)

Github cleanup consists of deleting your fork and forking again the [official latest released version](https://github.com/nightscout/cgm-remote-monitor).

Follow [Step 1 of this guide (ONLY STEP1!)](../../update/redeploy/#step-1-cleanup-github).

</br>

## [Heroku](https://id.heroku.com/)

If you experience issues during deployment you might end up with many apps. Make sure you keep the last one that was functional or delete all before attempting a new deployment. This will just make it easier to find which app you're trying to build. Keeping sleeping apps doesn't have any negative impact but no real advantage unless you do it on purpose.

If you're not convinced you want to delete an app, make sure to put it in maintenance mode to avoid wasting free dyno hours. This will also help you understand if you use it as the related Nightscout site will report offline for maintenance.

</br>

### Maintenance mode

Maintenance mode is useful to troubleshoot Dexcom and CareLink accounts locked and also if you need to modify several variables without having Nightscout restarting every change.

You can also put your Nightscout in maintenance mode if you won't use it for an extended period of time.

Be aware that your MongoDB Atlas database might also go in sleep mode and you will need to [restart it manually](../connection_string/#mongodb-paused).

<img src="../img/Cleanup00a.png" style="zoom:80%;" >

</br>

### Delete an app

Deleting an Heroku app does **not** delete your Nightscout data, but you might want to write down your variables (definitely backup your connection string) if your site was functional before. Note that you can also rename an app (unless the name is already in use in heroku.com).

<img src="../img/Cleanup00.png" style="zoom:80%;" >

To delete an app, select it and go to `Settings`, scroll down to `Delete App`

<img src="../img/Cleanup01.png" style="zoom:80%;" >

Copy and paste your app name to confirm deletion, 

<img src="../img/Cleanup02.png" style="zoom:80%;" >

</br>

## [Atlas](https://account.mongodb.com/account/login)

It is very easy to get lost in Atlas.

The structure from top to bottom is: Organization, Projects and Databases. You can have several organizations, each of them several projects and each of them several databases.

!!!note
    If you are deploying a brand new Nightscout make sure you have one organization, one project and one cluster created. No more no less.

If you want to cleanup Atlas, unless you don't have data, you must first find out which database contains your data. For this, start from `View All Organizations`:

<img src="../img/Cleanup03.png" style="zoom:80%;" >

You can delete empty organizations (those without any project inside).

<img src="../img/Cleanup04.png" style="zoom:80%;" >

Select the organization, then top left the cog wheel to go in `Settings`, then scroll down to `Delete Organization`: `Delete`.

<img src="../img/Cleanup06.png" style="zoom:80%;" >

If an organization is connected to mLab delete it only if you don't want to migrate the database or if you're done it with another organization. Deleting an organization without projects will not delete your data. 

<img src="../img/Cleanup05.png" style="zoom:80%;" >

------

Once inside an organization, you will see its projects. You can safely delete projects without clusters.

<img src="../img/Cleanup07.png" style="zoom:80%;" >

Deleting an empty project doesn't delete your Nightscout data.

<img src="../img/Cleanup08.png" style="zoom:80%;" >

For non-empty projects continue reading before deciding to delete them.

------

You can then move to your project (select it) and check its database(s) selecting `COLLECTIONS`

<img src="../img/Cleanup09.png" style="zoom:80%;" >

An empty project will look like below, and this is typically what you have before deploying Nightscout in Heroku. Once Nightscout is deployed in a project, a new database will be created there.

<img src="../img/Cleanup10.png" style="zoom:80%;" >

The database currently used by your Nightscout is the one specified in the connection string, in the example below `dbname`. Whenever you change the database name in the connection string, a new database will be created in your project.

`mongodb+srv://atlasusername:atlaspassword@cluster0.zzzzz.mongodb.net/`**`dbname`**`?retryWrites=true&w=majority`

There is usually one database for Nightscout, if there are several, select one and then the other(s) to understand which one contains your data. For this, select `entries`.

<img src="../img/Cleanup11.png" style="zoom:80%;" >

A large database is most probably one you want to keep.

<img src="../img/Cleanup12.png" style="zoom:80%;" >

You can safely delete empty databases (check the size first).

<img src="../img/Cleanup13.png" style="zoom:80%;" >

!!!warning "If you're not sure you're deleting the right database, just leave it."

Hover on the database name and click the bin icon. Confirm deletion by copying the database name and click `Drop`.

<img src="../img/Cleanup14.png" style="zoom:80%;" >

If your database gets recreated after you deleted it this means you MONGODB_URI or MONGO_CONNECTION string is pointing to it.

</br>

<span style="font-size:larger;">If you want to delete a non-empty Project you need to terminate all clusters belonging to it.</span></span>

<img src="../img/Cleanup15.png" style="zoom:80%;" >

!!!warning "Terminating a cluster will delete all information and databases in this cluster!"

Confirm with your cluster name and wait until shutdown is complete.

<img src="../img/Cleanup16.png" style="zoom:80%;" >

You can then delete the empty project.

