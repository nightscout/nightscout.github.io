# Troubleshoot Heroku

</br>

(heroku-nothing-here)=

## There's nothing here

<img src="/vendors/heroku/img/TShoot57.png" width="400px" >

If you didn't upgrade Heroku to an Eco or Basic plan, you need to [create a new Nightscout site](/nightscout/new_user) and [recover your MongoDB Atlas connection string](/troubleshoot/atlas.md#recover-your-connection-string).

If you just upgraded to an Eco or Basic plan, make sure you enabled the web app (that turned off when the Free plan was removed).

<img src="/vendors/heroku/img/TShoot58.png" width="600px" >

If you just tried to deploy a new Nightscout site, something went wrong. [Cleanup](#cleanup) your Heroku apps and retry...

</br>

## Application Error

<img src="/vendors/heroku/img/TShoot05.png" width="500px" >

 [Update Nightscout to latest release](/update/update.md). It might not fix your issue but it will help find a solution.

- Check your MongoDB Atlas [database is not full](/troubleshoot/atlas.md#database-full).
- If you're creating a new Nightscout site, it might have failed because of a [wrong connection string](/troubleshoot/atlas.md#unable-to-connect-to-mongo).
- If you don't see any good reason [restart all dynos](#restart-all-dynos).

</br>

## A valid GitHub Directory could not be found.

When trying to deploy a new Nightscout site, this message appears when clicking `Deploy to Heroku`.

<img src="/vendors/heroku/img/TShoot00.png" width="400px" >

- Change browser and retry.

</br>

(heroku-nogit)=

## Cannot find cgm-remote-monitor in Heroku / No GitHub source visible

When updating Nightscout, `cgm-remote-monitor` doesn't appear automatically in Heroku under your repository name.

<img src="/vendors/heroku/img/TShoot01.png" width="800px" >

When updating Nightscout, your repository name doesn't appear in `Manual Deploy` so that you can't select the `master` branch.

<img src="/vendors/heroku/img/TShoot04.png" width="800px" >

- `Disconnect` and re-`Connect` like this:

<img src="/vendors/heroku/img/UpdateNS22.png" width="800px" >

<img src="/vendors/heroku/img/UpdateNS21.png" width="800px" >

- If it doesn't help try to re-authorize as explained below:

</br>

## Cannot find cgm-remote-monitor in Heroku: Item cannot be retrieved

When updating Nightscout, `cgm-remote-monitor` doesn't appear automatically in Heroku under your repository name and an error message appears when you try to connect to GitHub.

<img src="/vendors/heroku/img/TShoot02.png" width="800px" >

- In Heroku, go to `Account Settings`

<img src="/vendors/heroku/img/NewNS13.png" width="800px" >

- Select `Applications` and click `Re-authorize`

<img src="/vendors/heroku/img/TShoot03.png" width="800px" >

- Click `Authorize GitHub` in the pop-up.
- If it doesn't help, you can also try to `Revoke access`... before going back to Re-`Connect` your GitHub account. This is necessary if someone else did setup Nightscout for you and left his own GitHub connected to your Heroku account.

</br>

## I can't log into Heroku

If you lost your password use the [password reset option](https://id.heroku.com/account/password/reset).

If you lost your authenticator use the recovery codes (that you hopefully saved when [securing your account)](/vendors/heroku/mfa).

If you lost or don't have anymore access to the email you used to create your Heroku account you will need to deploy a new Nightscout site. You can use the same GitHub account and the same MongodB Atlas database you currently have but will have to use another Nightscout site name in Heroku as the current one is already in use. First [recover your connection string](/troubleshoot/atlas.md#recover-your-connection-string), and proceed to [creating a new Nightscout](/vendors/heroku/new_user/) **skipping Step 3**.

</br>

## Restart all dynos

- Log in Heroku, go to `Settings`, `More`, `Restart all dynos`.

<img src="/vendors/heroku/img/MigrateNS57.png" width="800px" >

</br>

## Sleeping app

Check you app didn't fall asleep:

<img src="/vendors/heroku/img/TShoot25.png" width="300px" >

</br>

A sleeping app can be due to your Heroku Eco plan: a Basic plan makes the app never sleep. [https://www.heroku.com/pricing](https://www.heroku.com/pricing) 

Another reason for a sleeping app can be due to a failure to obtain data from Dexcom Share, check the logs to understand the reasons.

</br>

## Cleanup

If you experience issues during deployment you might end up with many apps. Make sure you keep the last one that was functional or [delete](#delete-an-app) all before attempting a new deployment. This will just make it easier to find which app you're trying to build. Keeping sleeping apps doesn't have any negative impact but no real advantage unless you do it on purpose.

Make sure the app you're using for Nightscout is running on an Eco/Basic tier.

If you're not convinced you want to delete an app, make sure to put it in maintenance mode to understand if you use it as the related Nightscout site will report offline for maintenance.

</br>

### Maintenance mode

Maintenance mode is useful to troubleshoot Dexcom and CareLink accounts locked and also if you need to modify several variables without having Nightscout restarting every change.

You can also put your Nightscout in maintenance mode if you won't use it for an extended period of time.

```{warning}
**Putting your site in maintenance mode won't stop billing!**</br></br>
You also need to disable the web service for this.</br></br>
<img src="/vendors/heroku/img/TShoot59.png" width="600px" >
```

Be aware that your MongoDB Atlas database might also go in sleep mode and you will need to [restart it manually](/troubleshoot/atlas.md#mongodb-paused).

<img src="/vendors/heroku/img/Cleanup00a.png" width="500px" >

</br>

### Delete an app

Deleting an Heroku app does **not** delete your Nightscout data, but you might want to write down your variables (definitely backup your connection string) if your site was functional before. Note that you can also rename an app (unless the name is already in use in heroku.com).

<img src="/vendors/heroku/img/Cleanup00.png" width="300px" >

To delete an app, select it and go to `Settings`, scroll down to `Delete App`

<img src="/vendors/heroku/img/Cleanup01.png" width="600px" >

Copy and paste your app name to confirm deletion, 

<img src="/vendors/heroku/img/Cleanup02.png" width="600px" >

</br>

## Backup your site variables

Having a copy of your variables is very important since some of them are vital to your site like MONGODB_URI and your access to it like API_SECRET.

### Method 1 - Spreadsheet

Log into [Heroku](https://dashboard.heroku.com/apps), select your app.  
Reveal your Heroku Nightscout app [Config Vars](/vendors/heroku/new_user.md#editing-config-vars-in-heroku) and copy all variables names and values in a spreadsheet.

### Method 2 - Export

Log into [Heroku](https://dashboard.heroku.com/apps), select your app.  
Click on the top right `More` button and select `Run console`.

<img src="/vendors/heroku/img/HerokuM01.png" width="300px" >

In the console command line type the command below, then click `Run`.

```
export `heroku config -s`
```

<img src="/vendors/heroku/img/HerokuM02.png" width="600px" >

Wait until the command completes.

<img src="/vendors/heroku/img/HerokuM03.png" width="500px" >

Save the session: it contains all your variables and values (and a few useless things).

<img src="/vendors/heroku/img/HerokuM04.png" width="300px" >

Edit the file with a text editor and remove the first line `(bash: line 1: heroku: command not found)`.  
Using find and replace, get rid of all `declare -x`.  
Delete the following Heroku specific variables:  

`DYNO="run.6309"
HOME="/app"
MEMORY_AVAILABLE="512"
NODE_ENV="production"
NODE_HOME="/app/.heroku/node"
OLDPWD
PATH="/app/.heroku/node/bin:/app/.heroku/yarn/bin:/usr/local/bin:/usr/bin:/bin:/app/bin:/app/node_modules/.bin"
PORT="6489"
PS1="\\[\\033[01;34m\\]\\w\\[\\033[00m\\] \\[\\033[01;32m\\]\$ \\[\\033[00m\\]"
PWD="/app"
SHLVL="1"
TERM="xterm-256color"
WEB_CONCURRENCY="1"
WEB_MEMORY="512"`

```{warning}
Save this file in a safe place.</br>Call it `heroku.env` as it's your Heroku environment variables.
```

</br>

## Roll back Heroku

</br>

Roll back can be really useful in case of mistakes and when awaiting bug fixes in minor releases.

```{warning}
You can only roll back to a version that was previously deployed to your Heroku app.
```

Heroku keeps history of variables modifications and previous deploys so that you can return to a previous state easily in the cases of a configuration mistake or a bad deploy (like a bugged version). When rolling back to a previous deploy keep in mind all variables modified in the mean time will return to the value they had at that time.

Since the database is external to Heroku, it will not be impacted by a roll back.

</br>

- Log into [Heroku](https://id.heroku.com/login).
- Select your Nightscout app and go to  `Activity`

<img src="/vendors/heroku/img/Downgrade00.png" width="600px" >

</br>

- You will see a list of events called `Activity Feed` and some indicated as possible roll-back points. Identify the last good situation and select `Roll back to here`

<img src="/vendors/heroku/img/Downgrade01.png" width="400px" >

</br>

- Identify and eventually write down the values of the variables that were changed in the meantime (arrows in the picture below) before selecting `Rollback`.

<img src="/vendors/heroku/img/Downgrade02.png" width="500px" >

</br>

Upon completion your Heroku will be returned to the state it was at the selected rollback point.

You can use it like this or upgrade to the latest released version later on.

</br>

- If you change your mind later you can rollback prior to your rollback and return to the starting point.

<img src="/vendors/heroku/img/Downgrade03.png" width="400px" >

</br>

## Stop using Heroku

If you want to migrate your data, it is recommended that you do it **before** switching off your Heroku Nightscout.

To stop using Heroku and suspend billing, you only need to switch off all apps like this:

- [Log](https://id.heroku.com/login) into Heroku.
- Select your app(s) in the dashboard.

<img src="/vendors/heroku/img/MultiNS00.png" width="800px" >

- In `Resources`, edit (pen icon) and turn off the `web` server switch.

<img src="/vendors/heroku/img/Cleanup03.png" width="800px" >

- Your Heroku Nightscout site will stop and **only the current month** will be billed.
- You can keep your Heroku account and leave the credit card, once no app is active billing will stop.
- Your data will not be deleted, make a copy of the `MONGODB_URI` variable if you want to reuse it with another platform, or migrate your database.
- If you decide you will not use it anymore, once last billing has occurred, you can delete your app(s), credit card and Heroku account.

</br>
