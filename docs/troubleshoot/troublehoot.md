# GitHub and Heroku

</br>

## A valid GitHub Directory could not be found.

</br>

When trying to deploy a new Nightscout site, this message appears when clicking `Deploy to Heroku`.

<img src="../img/TShoot00.png" style="zoom:70%;" >

- Change browser and retry.

</br>

## Cannot find cgm-remote-monitor in Heroku / No GitHub source visible

</br>

When updating Nightscout, `cgm-remote-monitor` doesn't appear automatically in Heroku under your repository name.

<img src="../img/TShoot01.png" style="zoom:80%;" >

When updating Nightscout, your repository name doesn't appear in `Manual Deploy` so that you can't select the `master` branch.

<img src="../img/TShoot04.png" style="zoom:80%;" >

- `Disconnect` and re-`Connect` like this:

<img src="../../update/img/UpdateNS22.png" style="zoom:80%;" >

<img src="../../update/img/UpdateNS21.png" style="zoom:80%;" >

- If it doesn't help try to re-authorize as explained below:

</br>

## Cannot find cgm-remote-monitor in Heroku: Item cannot be retrieved

</br>

When updating Nightscout, `cgm-remote-monitor` doesn't appear automatically in Heroku under your repository name and an error message appears when you try to connect to GitHub.

<img src="../img/TShoot02.png" style="zoom:80%;" >

- In Heroku, go to `Account Settings`

<img src="../../nightscout/img/NewNS13.png" style="zoom:80%;" >

- Select `Applications` and click `Re-authorize`

<img src="../img/TShoot03.png" style="zoom:80%;" >

- Click `Authorize GitHub` in the pop-up.

</br>

# Nightscout crash

</br>

## Application Error

</br>

<img src="../img/TShoot05.png" style="zoom:80%;" >

- [Update Nightscout to latest release](../update/update.md).
- It might not fix your issue but it will help find a solution.

</br>

## Boot Error - Unable to connect to Mongo

</br>

The database Heroku is pointing to is not available (like mLab after Nov 10th 2020)

Your Atlas connection string is incorrect

<img src="../img/TShoot06.png" style="zoom:80%;" >

- Open Heroku and `Reveal Config Vars` in `Settings`

<img src="../../update/img/MigrateNS03.png" style="zoom:80%;" >

- Search for a variable called `MONGODB_URI` or `MONGO_CONNECTION`
- Verify it is looking like this (without < and > characters)

`mongodb+srv://atlasusername:atlaspassword@cluster0.zzzzz.mongodb.net/dbname?retryWrites=true&w=majority`

- If you've just migrated to Atlas, try to use [this help page](../../update/stringhelp.html) to verify or recreate it.
- If you've just created a new site, try to use [this help page](../../nightscout/stringhelp.html) to verify or recreate it.
- To recover your connection string log into [Atlas](https://cloud.mongodb.com/)
- Click `Connect` on your cluster

<img src="../img/TShoot07.png" style="zoom:80%;" >

- Click `Connect your application`

<img src="../img/TShoot09.png" style="zoom:80%;" >

- Click `Copy` then `Close`

<img src="../img/TShoot10.png" style="zoom:80%;" >

- Open the [the help page](../../nightscout/stringhelp.html) in a new tab and paste the string in the first field.
- If you don't remember your password invent a new one.
- Copy the resulting string in your Heroku variable `MONGODB_URI` or `MONGO_CONNECTION`
- If you changed the password in the string you need to change it in the database too:
- Click `Database Access`

<img src="../img/TShoot11.png" style="zoom:80%;" >

- At the end of the line, click `Edit`

<img src="../img/TShoot08.png" style="zoom:80%;" >

- In `Password` click `Edit Password`

<img src="../img/TShoot12.png" style="zoom:80%;" >

- Write down your new password make it the same than the one in your connection string

<img src="../img/TShoot13.png" style="zoom:80%;" >

- Click `Update User`

<img src="../img/TShoot14.png" style="zoom:80%;" >

- Refresh your Nightscout web page display

</br>

# No data in Nightscout

</br>

## Just after migrating from mLab to Atlas

</br>

- If not already done, [Update Nightscout to latest release](../update/update.md).
- Verify your Atlas database is not read only, if migration went well on the first time it should be like this, else click `Edit`

<img src="../img/TShoot15.png" style="zoom:80%;" >

- Change the permissions to `Atlas Admin` and `Update User`

<img src="../img/TShoot16.png" style="zoom:80%;" >