# Troubleshoot Fly.io

</br>

```{warning}
The web terminal feature was removed from Fly.io.
You need a computer with flyctl.
```

Follow [these instructions](https://fly.io/docs/hands-on/install-flyctl/) to install `flyctl` on your computer.  You also need to [install git](https://git-scm.com/downloads) if you're using a Windows computer.

*Note for Windows: you might experience issues with Git Bash or PowerShell, try an elevated command prompt.*

</br></br>

## Restart your app

Follow [these instructions](https://fly.io/docs/hands-on/install-flyctl/) to install `flyctl` on your computer.

*Note for Windows: you might experience issues with Git Bash or PowerShell, try an elevated command prompt.*

- Log in Fly.io:

`flyctl auth login` 

- Verify your Nightscout app name

`flyctl app list`

- Restart your app (replace `example-ns` by the name of your Nightscout app in Fly.io)

`flyctl machine restart --app example-ns`

</br>

(recover-fly-toml)=

## Recover `fly.toml`

Follow [these instructions](https://fly.io/docs/hands-on/install-flyctl/) to install `flyctl` on your computer.

*Note for Windows: you might experience issues with Git Bash or PowerShell, try an elevated command prompt.*

- Log in Fly.io:

`flyctl auth login` 

- Verify your Nightscout app name

`flyctl app list`

- Copy your Nightscout app (replace `example-ns` with your own) configuration file `fly.toml`.

`flyctl config save --app example-ns`

- Keep this file in a safe place as you'll need it to redeploy or upgrade your Nightscout.

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

#### If you deployed with your own computer.

```{warning}
Make a backup of the `fly.toml` file present in the `cgm-remote-monitor` folder!
This is essential to make your site maintainable!
```

You can delete the `cgm-remote-monitor` folder on your computer and fork it again. 

Exit the folder before deleting it, in task manager end the `flyctl.exe` task. 

#### If you deployed from the web terminal.

You don't have a local repository.

</br>

## Downscale your app

Follow [these instructions](https://fly.io/docs/hands-on/install-flyctl/) to install `flyctl` on your computer.

*Note for Windows: you might experience issues with Git Bash or PowerShell, try an elevated command prompt.*

</br>

March 31st 2023, apps deploy in V2 and V1 apps are automatically migrated too.  
This causes some issues as V2 automatically deploys in a more than one machine, your Nightscout site might not work correctly.

Type the following command in the terminal (replace ***`example-ns`*** with your own app name):

- Authenticate in Fly.io:


`flyctl auth login`

- Verify your Nightscout app name

`flyctl app list`

- Downscale your app:

`flyctl scale --app `***`example-ns`***` count 1`

<img src="/vendors/fly.io/img/FlyT08.png" width="600px" />

- Your app should now only be running on one machine. Check [here](https://fly.io/dashboard/personal/machines).


***Note:*** *the builder app is normal, it is stopped: don't worry about it.*

<img src="/vendors/fly.io/img/FlyT09.png" width="600px" />

</br>

## Obtain a free shared IP

Follow [these instructions](https://fly.io/docs/hands-on/install-flyctl/) to install `flyctl` on your computer.

*Note for Windows: you might experience issues with Git Bash or PowerShell, try an elevated command prompt.*

</br>

Apps migrated from Heroku will use a dedicated IP billed $1.90/month.

If you want to run your Nightscout site in Fly.io for free, you will need to release the IP and request a shared IP.

Follow the instructions below. The IP `137.66.11.78` and the site name `example-ns` are examples, yours will be different. Use your own IP and site name.

Open a browser and authenticate:

`flyctl auth login`

List the apps to see the name of your Nightscout project:

`flyctl app list`

```
NAME         OWNER           STATUS          PLATFORM        LATEST DEPLOY
example-ns   personal        deployed        machines        2023-05-26T07:24:51Z
```

List the IPs used by your app (replace *`example-ns`* by your own):

`flyctl ips list -a example-ns`

```
VERSION IP                      TYPE    REGION  CREATED AT
v4      137.66.11.78            public  global  2022-09-13T14:17:58Z
v6      3b09:8280:1::3:723c     public  global  2022-09-13T14:18:00Z
```

Release the dedicated IP you found above (example: 137.66.11.78):

`flyctl ips release 137.66.11.78 -a example-ns`

```
Released 137.66.11.78 from example-ns
```

Assign a shared IP to your Nightscout site:

`flyctl ips allocate-v4 --shared -a example-ns`

```
v4      <new-ip-assigned> shared  global
```

You do not need to remember your new IP, just continue using your site name as before: https://yoursitename.fly.dev

</br>

## Migrate from Heroku

```{warning}
Turboku has been removed from the CLI. This section is obsolete.
```

Log into Heroku.

- Write down your Nightscout app name from the [dashboard](https://dashboard.heroku.com/apps).
- Get your **API Key** from your [account settings](https://dashboard.heroku.com/account). Do not share it publicly.

Look into [this list](https://fly.io/docs/reference/regions/) and find a free region close to where you live. This is a 3 letters code, for example `ams`.

Open a terminal or an elevated command prompt.

*Note for Windows: you might experience issues with Git Bash or PowerShell, try an elevated command prompt.*

- Log in Fly.io:

`flyctl auth login` 

- Replace `example-ns` with your Nightscout app from Heroku, `API-Key` with your Heroku API Key and `xxx` with the region you selected.

`flyctl turboku example-ns API-Key --region xxx`

- Your Heroku app will deploy in Fly.io. Wait until deployment completes.
- You'll see the name of your new Nightscout site with Fly.io.

```
Finished launching new machines
-------
 ✔ Machine 784e290f461048 [app] update finished: success
-------
Visit your newly deployed app at https://example-ns.fly.dev/
```

- Downscale the app, confirm when requested.

`flyctl scale --app example-ns count 1`

- Turn your Heroku site off (the switch `web node lib/server/server.js`) and check your new Fly.io Nightscout is running.
- Log into Fly.io, [select your app](https://fly.io/apps) and verify it's using a share V4 IP, release the V6 IP.

</br>

```{warning}
Make a backup of your fly.toml!
This is essential to make your site maintainable!
```

- Fly deployment created a folder with your app name, you'll find your `fly.toml` file inside. This file is all what you need to redeploy your project. You will need it to upgrade your Nightscout site or redeploy it.



```{warning}
Make a [backup of your Heroku variables](/troubleshoot/heroku.md#backup-your-site-variables)!
Fly.io will store then as secrets and you won't be able to read them!
```

</br>

