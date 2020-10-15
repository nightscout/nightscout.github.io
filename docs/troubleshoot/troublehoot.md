# Overall third party services

</br>

## Before troubleshooting

</br>

Check the services you're using.

Dexcom: [https://status.dexcom.com/](https://status.dexcom.com/)

Carelink US: [https://carelink.minimed.com/](https://carelink.minimed.com/)

Carelink non-US: [https://carelink.minimed.eu/app/login](https://carelink.minimed.eu/app/login)

GitHub: [https://www.githubstatus.com/](https://www.githubstatus.com/)

Heroku: [https://status.heroku.com/](https://status.heroku.com/)

Atlas: [https://status.cloud.mongodb.com/](https://status.cloud.mongodb.com/)

</br>

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

# Atlas

</br>

## Limit of one free cluster.

</br>

When creating a new site or migrating (usually not the first attempt), when reaching `Target Cluster`.

<img src="../img/TShoot17.png" style="zoom:80%;" >

- Click the leaf top left in your Atlas account. Look at the `Project Name` you wanted to use when creating your new cluster, it shouldn't contain a cluster yet (like the example below, I tried to create a new Nightscout site but there is already a cluster inside the project I wanted to use). You can't have two clusters in a free project. Click your `Project Name`.
- This should not happen in normal conditions. Before deleting a cluster, check it doesn't contain your data!

<img src="../img/TShoot18.png" style="zoom:80%;" >

- Click on `Collections` in the cluster you selected.

<img src="../img/TShoot19.png" style="zoom:80%;" >

- Click on `entries`

<img src="../img/TShoot20.png" style="zoom:80%;" >

- In the case there is data, like in the example below, **don't use this cluster**. Leave it like this and create a new one.

<img src="../img/TShoot21.png" style="zoom:80%;" >

- **If there no data**, you can safely delete it.

<img src="../img/TShoot22.png" style="zoom:80%;" >

- In this cluster you want to delete click `...` then `Terminate`

<img src="../img/TShoot23.png" style="zoom:80%;" >

- Copy the cluster name to confirm then click `Terminate`

<img src="../img/TShoot24.png" style="zoom:80%;" >

- Wait until the operation completes.
- You can now use this project name to create a new site.

</br>

# Nightscout page doesn't open

</br>

## Application Error

</br>

<img src="../img/TShoot05.png" style="zoom:80%;" >

- [Update Nightscout to latest release](../update/update.md).
- It might not fix your issue but it will help find a solution.

</br>

- If your site is already up to date, try to restart your app: log in Heroku, go to `Settings`, `More`, `Restart all dynos`.

<img src="../../update/img/MigrateNS57.png" style="zoom:80%;" >

</br>

## Boot Error - Unable to connect to Mongo

</br>

Look at this [dedicated page](./connection_string.md).

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

</br>

## Dexcom data not showing

</br>

If you are using a Dexcom system, and your data is not appearing in Nightscout, there are only a limited number of reasons for that. You should check your (1) Heroku settings and (2) Dexcom Share.

NOTE: The #1 reason why BGs aren't showing is that you have mismatched password and user names in Heroku settings and Dexcom. Please see blue box below for that error.

### Heroku Settings

Login to your Heroku account and from within Heroku `Settings`, click on the  `Reveal Config Vars`

<img src="../../nightscout/img/config-vars.png" width="800">

</br>


Now from the `Config Vars` area, check the following (see screenshot below for reference):

1. You must use the same `BRIDGE_PASSWORD` or `BRIDGE_USER_NAME` that your Dexcom mobile app is using.
2. You must have `bridge` and `careportal` on the `ENABLE` line (you can have other values there...but don't forget these two).
3. If you are outside the USA, you must add `BRIDGE_SERVER` set to `EU` in Heroku settings.
4. Your `careportal` must be one word in the `ENABLE` line, sometimes autocorrect makes it two words.
5. If using `mmol`, make sure you have spelled that value correctly in the `DISPLAY_UNITS`.

<img src="../../nightscout/img/bridge-settings.jpg" width="600">

</br>


One thing that can happen if you have an incorrect Dexcom login/password in Loop's CGM Share account settings and/or in your Nightscout BRIDGE settings is that Dexcom will lock your account...and you won't see CGM data in Nightscout. If you notice your CGM readings disappeared, but everything else is flowing...check your Heroku logs that are viewable by selecting "View Logs" from the drop-down menu underneath the "More" option. 

<img src="../../nightscout/img/heroku-logs.png">

</br>

Do your logs have "SSO authentication errors" like in the red box highlighted above? If you do, then:

1. Delete your share account entry from your Loop's CGM account settings...like you should have NO ENTRY in your share account settings WITHIN LOOP CGM SETTINGS.

2. Delete your BRIDGE entries within Heroku settings.  Don't delete the rows, just delete the entries within BRIDGE_PASSWORD and BRIDGE_USER_NAME.

3. Wait 15 minutes and then follow the directions in the blue box below. It is important to wait the 15 minutes...the reason you can't log in right now is that your Dexcom account has a temporary lock from one of the passwords in step 1 or 2 being incorrect. The temporary lock will expire after 10-15 minutes of giving the account login a break from the incorrect logins. So, definitely wait or else you'll just keep prolonging the issue.


!!!info "About your Bridge password and user name"
    The `BRIDGE_PASSWORD` and `BRIDGE_USER_NAME` are NOT visible from within your Dexcom mobile app or online account. The values of them are what you entered into your Dexcom mobile app when you VERY FIRST logged into that app however long ago. If you have double-checked everything else that could be incorrect and BGs still aren't showing in Nightscout, then you likely have those Bridge values incorrect. To fix that, delete your Dexcom app (don't stop the session before deleting the app...just keep it going). Download the app again from the iPhone's App Store and login to the freshly-downloaded Dexcom app. **Take note** that deleting the app will not stop your session, your session will pick right back up once the transmitter pairs again. The `BRIDGE_USER_NAME` is not an email address. Use that exact same login now in your Heroku settings. You can leave your Loop's Share account info blank...you just need the transmitter ID going forward.
    

### Dexcom Share

Make sure you have Dexcom Share turned ON in your Dexcom app. In the Dexcom app's main screen, find the triangle made of dots. If the dots are grey, you do not have Share turned on. Tap the triangle, and follow the directions to add a follower (yourself if you don't have someone else you'd like to invite) and turn on Share.

<img src="../../nightscout/img/sharing.jpg" width="250">