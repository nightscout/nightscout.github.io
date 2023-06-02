# Troubleshoot Fly.io

</br>

## Cleanup

After several failed attempts to deploy or migrate, you might need to delete some apps.

Log into Fly.io [https://fly.io/app/sign-in](https://fly.io/app/sign-in) (GitHub recommended)

<img src="/vendors/fly.io/img/FlyIO00.png" width="400px" />

In normal running condition you will see only two apps on your dashboard:  
The first one is your Nightscout site and the second one the builder (necessary).  
If you used the migration wizard you will see another builder (three apps).

<img src="/vendors/fly.io/img/FlyT01.png" width="600px" />

</br>

Clicking on your site you will see if it's healthy and running. This is where you go to open your site.

<img src="/vendors/fly.io/img/FlyT01.png" width="600px" />

</br>

### Delete an app

Select an app from the dashboard. Then click `Settings`.  
Click `Delete app`.

<img src="/vendors/fly.io/img/FlyT03.png" width="600px" />

Confirm copying the app name below, then click `Yes, delete it`.

<img src="/vendors/fly.io/img/FlyT04.png" width="600px" />

You have deleted your app.

If you delete the builder (like in the picture above) you won't be able to deploy anymore.

</br>

### Delete your local repository

You can delete the `cgm-remote-monitor` folder on your computer and fork it again.  
Just make sure you backup the `fly.toml` file if you had a functional Nightscout site!!!

If you run PowerShell in Windows, exit the folder before deleting it, in task manager end the `flyctl.exe` task. 

</br>

## Make your migrated app maintainable

Follow these instructions  to make your site maintainable and upgradable.

### Step 1: Create a GitHub account and fork the Nightscout project

```{tab-set}

:::{tab-item} I don't have a GitHub Account
### Create a GitHub account
::: {include} /vendors/github/create.md
### Fork the Nightscout project
:::{include} /vendors/github/fork.md
:::

:::{tab-item} I already have a GitHub Account
### Update your Nightscout fork
:::{include} /vendors/github/update_b.md
:::

```

</br>

### Step 2: Download fly.io Command Line Interface (CLI)

Fly.io is mainly managed through a command line interface (CLI). The first step will be installing the CLI [as documented here](https://fly.io/docs/flyctl/installing/). You need a computer for this.

`flyctl is a command line interface to the Fly.io platform.`

`It allows users to manage authentication, application launch,
deployment, network configuration, logging and more with just the
one command.`

</br>

### Step 3: Locally fork and deploy cgm-remote-monitor

a) Clone the `cgm-remote-monitor` repository locally:

If necessary install [Git](https://git-scm.com/downloads) on your computer (pick your own OS in Downloads).

Open a PowerShell (Windows) or a terminal (OSX/Linux), and type (replace `yourGitHubNameHere` by your own GitHub account name):

`git clone https://github.com/yourGitHubNameHere/cgm-remote-monitor`

<img src="/vendors/fly.io/img/FlyIO01.png" width="600px" />

</br>

b) Navigate to the directory where you code has been cloned locally

`cd cgm-remote-monitor`

</br>

c) Recover the `fly.toml` deployment file from your migrated app. In the command line below replace `yourAppName` by the app name (usually your Nightscout site name: **`yourAppName`**`.fly.dev`).

`flyctl config save -a yourAppName`

</br>

d) Change the internal port number.

Edit the `fly.toml` file and replace `internal_port = 8080` by `internal_port = 1337`.  
Save the file.

</br>

e) Recreate the environment variables.

### If you migrated from and still have access to Heroku

Backup your Heroku environment variables as explained [here](/troubleshoot/heroku.md#method-2-export).

Edit the `fly.toml` file and paste all variables after `[env]`. Save the file.

*Note: if you don't see `MONGODB_URI` but see `MONGO_CONNECTION` (NOT `MONGO_COLLECTION`) use its value.*

**If you lost access to Heroku or you don't want to transform them in environment variables**

You can leave the variables as secrets and use [this method](/vendors/fly.io/new_user.md#secrets) when you need to modify them.

### If you lost access to Heroku but you want the variables to be easily maintainable

Download the default [`fly.toml`](/_static/fly.toml) and correct all the variables values.

Make sure the app name `app =`  is matching your site name.

</br>

f) Deploy the changes.

Type the command:

`flyctl deploy`

Deploy will take some time and should complete with the message `1 desired, 1 placed, 1 healthy, 0 unhealthy [health checks: 1 total, 1 passing]`.

If you decided to keep the variables secret you have completed recovery.

</br>

g) Verify your environment variables:

Type the command:

`flyctl config env`

You will see two lists of variables.  
The first one will be your secrets.

<img src="/vendors/fly.io/img/FlyT05.png" width="400px" />

Followed by the environment variables.

<img src="/vendors/fly.io/img/FlyT06.png" width="600px" />

Make sure the environment variables match.

</br>

h) Delete all secrets.

You will need to delete the secrets.

Copy paste this command line for the most usual ones. Wait until redeploy completes.

`flyctl secrets unset ALARM_HIGH ALARM_LOW ALARM_TIMEAGO_URGENT ALARM_TIMEAGO_URGENT_MINS ALARM_TIMEAGO_WARN ALARM_TIMEAGO_WARN_MINS ALARM_TYPES ALARM_URGENT_HIGH ALARM_URGENT_LOW API_SECRET BG_HIGH BG_LOW  BG_TARGET_BOTTOM BG_TARGET_TOP BRIDGE_PASSWORD BRIDGE_SERVER BRIDGE_USER_NAME CUSTOM_TITLE DISPLAY_UNITS ENABLE MMCONNECT_PASSWORD MMCONNECT_SERVER MMCONNECT_USER_NAME MONGODB_URI NIGHT_MODE PAPERTRAIL_API_TOKEN SHOW_PLUGINS SHOW_RAWBG THEME TIME_FORMAT AUTH_DEFAULT_ROLES BASAL_RENDER BOLUS_RENDER_FORMAT_SMALL BOLUS_RENDER_OVER DEVICESTATUS_ADVANCED IAGE_INFO IAGE_URGENT IAGE_WARN OPENAPS_COLOR_PREDICTION_LINES OPENAPS_FIELDS PUMP_FIELDS PUMP_URGENT_BATT PUMP_WARN_BATT SAGE_INFO SAGE_URGENT SAGE_WARN SCALE_Y SHOW_FORECAST`

Continue to use `flyctl secrets unset` until all secrets have been removed.

Verify your site is still functional.

</br>

```{danger}
Do NOT update your online fork of `cgm-remote-monitor` from your local version!
Your `fly.toml` contains confidential information that might be visible to anybody if you do so.
```

Congratulations. You can now easily [modify your Nightscout Fly.io variables](/vendors/fly.io/new_user.md#env-variables) and [update](/update/update) your site.
