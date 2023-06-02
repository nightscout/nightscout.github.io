# Deploy another version

If you need to return to the previous Nightscout version, or in rare occasions, like testing a specific fix or a feature that is not released yet (i.e. not in the `master` branch), you might need to deploy another branch like `dev` in the example below.

Do not deploy `dev` or a branch other than `master` unless directed to do so (except if you know why you are doing so).

## Step 1: Update your repository in GitHub

- Skip this step if you're using Azure.
- Click here to log in at GitHub: [https://github.com/login](https://github.com/login).
- Enter your username or email and your password. Click `Sign in`

<img src="/vendors/github/img/UpdateNS00.png" width="400px" >

</br>

- Select your own `cgm-remote-monitor` project (**not `nightscout/cgm-remote-monitor`**)

<img src="/vendors/github/img/UpdateNS01.png" width="400px" >

</br>

- Your repository will open. 

<img src="/vendors/github/img/Dev00.png" width="400px" >

- In the branch drop down menu (normally showing `master`) select  `dev`

<img src="/vendors/github/img/Dev01.png" width="300px" >

</br>

- Click`Fetch upstream` to update it, then  `Fetch and merge`

<img src="/vendors/github/img/Dev03.png" width="800px" >

</br>

- After a moment, your repository should display `This branch is up to date with nightscout:dev`

<img src="/vendors/github/img/Dev04.png" width="500px" >

- If you ran into trouble, try to [Redeploy](/update/redeploy.md).

</br>

## Step 2: Deploy

```{tab-set}


:::{tab-item} Heroku
- Log in Heroku [https://id.heroku.com/login](https://id.heroku.com/login)</br></br>
<img src="/vendors/heroku/img/UpdateNS15.png" width="400px" ></br></br>
- Select your app (hidden in yellow)</br></br>
<img src="/vendors/heroku/img/UpdateNS16.png" width="600px" ></br></br>
- Click on `Deploy`</br></br>
<img src="/vendors/heroku/img/UpdateNS17.png" width="600px" ></br></br>
- Verify Heroku is connected to GitHub, if not, click `Connect to GitHub`</br></br>
<img src="/vendors/heroku/img/UpdateNS18.png" width="800px" ></br></br>
- If Heroku is not connected to GitHub, scroll down and click `Connect to GitHub`, if a popup window opens and requires authorization, click `Authorize Heroku`</br></br>
<img src="/vendors/heroku/img/UpdateNS19.png" width="800px" ></br></br>
- Verify your app `cgm-remote-monitor` is connected to GitHub</br></br>
<img src="/vendors/heroku/img/UpdateNS20.png" width="800px" ></br></br>
- If it isn't, In `Connect to GitHub`, type `cgm-remote-monitor` and click  `Search ` then click `Connect`</br></br>
<img src="/vendors/heroku/img/UpdateNS21.png" width="800px" ></br></br>
- If you have trouble connecting your app, click `Disconnect` and reconnect it as shown above</br></br>
<img src="/vendors/heroku/img/UpdateNS22.png" width="800px" ></br></br>
- Scroll down to the bottom of the page, select the `dev` branch and click `Deploy Branch` </br></br>
<img src="/vendors/heroku/img/Dev05.png" width="800px" ></br></br>
- Build will start and information will scroll in the log window. Do not leave the page, do not interfere and wait for completion. It might take more than 10 minutes. Interrupting the process will lead to a broken site and you'll need to restart deployment.</br></br>
<img src="/vendors/heroku/img/UpdateNS24.png" width="800px" ></br></br>
- Wait until the deploy process completes and click `View` (if nothing happens click `Manage App` then upper right `Open App`)</br></br>
<img src="/vendors/heroku/img/UpdateNS25.png" width="800px" ></br></br>
:::

:::{tab-item} Railway
- Open [Railway](https://railway.app) and click `login`. Login with GitHub.</br></br>
<img src="/vendors/railway/img/Railway00.png" width="600px" /></br></br>
<img src="/vendors/railway/img/Railway01.png" width="300px" /></br></br>
- Select your Nightscout project.</br></br>
<img src="/vendors/railway/img/RailwayM15.png" width="500px" /></br></br>
- Select your web app.</br></br>
<img src="/vendors/railway/img/RailwayM16.png" width="400px" /></br></br>
- Still in `Settings` look at `Environment`.</br>
- Change the `Deployment Trigger` with `dev` (it was showing `master`).</br></br>
<img src="/vendors/railway/img/Dev07.png" width="600px" /></br></br>
- If you only see `master` in the list you need to [redeploy](/update/redeploy.md) **taking care to select all branches and not only `master`**.</br> 
  <img src="/vendors/github/img/Dev06.png" width="500px" /></br></br>
- Once `dev` selected Railway will deploy automatically.</br>
:::

:::{tab-item} Northflank
- Log into Northflank: [https://app.northflank.com/login](https://app.northflank.com/login)</br>
- Select your Nightscout project</br></br>
<img src="/vendors/northflank/img/Dev14.png" width="600px" /></br></br>
- Select your Nightscout service</br></br>
<img src="/vendors/northflank/img/Dev15.png" width="500px" /></br></br>
- Click on the pen icon after the current branch (example below: `master`)</br></br>
<img src="/vendors/northflank/img/Dev16.png" width="600px" /></br></br>
- In the branch list, select the version you want to deploy, then click `Update Build Source`</br></br>
<img src="/vendors/northflank/img/Dev17.png" width="800px" /></br></br>
- Your site will redeploy with the selected branch</br>
:::

:::{tab-item} Azure
- Log into Azure : [https://portal.azure.com/](https://portal.azure.com/)</br>
- Select your App service, your Nightscout site name (you should see it in recent resources)</br></br>
<img src="/vendors/azure/img/Azure42.png" width="600px" /></br></br>
- If you didn't find it, it will show in App Services</br></br>
<img src="/vendors/azure/img/Azure43.png" width="400px" /></br></br>
- In the left menu select Deployment Center, in Full Image Name and Tag change the version to:</br></br>
`nightscout/cgm-remote-monitor:latest_dev`	(example for dev)</br></br>
Or whichever version (change `filter tag` find the version) in the [list]</br></br>(https://hub.docker.com/r/nightscout/cgm-remote-monitor/tags).</br></br>
`nightscout/cgm-remote-monitor:14.2.6`	(example for 14.2.6)</br></br>
<img src="/vendors/azure/img/Dev12.png" width="600px" /></br></br>
- Click Save (or Discard if you don't want to save).</br>
  Your site will redeploy if you changed the configuration. Expect a few minutes before it comes back online.</br></br>
<img src="/vendors/azure/img/Dev13.png" width="400px" /></br></br>
:::

:::{tab-item} Fly.io
Make sure you have a local fork of `cgm-remote-monitor` and the current fly.toml before continuing.</br>
If you don't, first perform [these operations](/troubleshoot/fly.io.md#make-your-migrated-app-maintainable).</br></br>
a) Open a PowerShell (Windows) or a terminal (OSX/Linux), and type:</br></br>
`cd cgm-remote-monitor`</br></br>
b) Update your local fork</br></br>
`git pull origin dev`</br></br>
c) Deploy the changes.</br></br>
`flyctl deploy`</br></br>
Deploy will take some time and should complete with the message</br>
`1 desired, 1 placed, 1 healthy, 0 unhealthy [health checks: 1 total, 1 passing]`.</br>
:::


```

</br>

Check your [profile time zone](/nightscout/profile_editor.md#profile-view) is correct. You're done!

</br>

</br>

## How to return to the `master` release

If things don't go as expected you can simply redeploy your `master` branch performing the same steps and using `master` instead of `dev`.

When the dev branch gets merged into release, just follow the [classic update method](/update/update.md).

</br>