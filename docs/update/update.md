# Update Nightscout

```{tip}
You don't need to follow these instructions if you use a hosted service.</br>Contact the vendor to learn more about possible updates.
```

</br>

[See here which is the current released version](https://github.com/nightscout/cgm-remote-monitor/releases) before updating.

</br>

## Step 1: Update your repository in GitHub

Select your current platform below:

````{tab-set}

:::{tab-item} Select your platform ->
</br>
:::

:::{tab-item} Heroku, Railway, Northflank (GitHub)
</br>- Click here to log in at GitHub: [https://github.com/login](https://github.com/login).</br></br>
- Enter your username or email and your password. Click `Sign in`</br></br>
<img src="/vendors/github/img/UpdateNS00.png" width="400px" ></br></br>
- Select your own `cgm-remote-monitor` project (**not `nightscout/cgm-remote-monitor`**)</br></br>
<img src="/vendors/github/img/UpdateNS01.png" width="400px" ></br></br>
- Your repository will open. </br></br>
<img src="/vendors/github/img/Dev00.png" width="400px" ></br></br>
- In the branch drop down menu (normally showing `master`) select  `dev`</br></br>
<img src="/vendors/github/img/Dev01.png" width="300px" ></br></br>
- Click`Fetch upstream` to update it, then  `Fetch and merge`</br></br>
<img src="/vendors/github/img/Dev03.png" width="800px" ></br></br>
- After a moment, your repository should display `This branch is up to date with nightscout:latest`</br></br>
<img src="/vendors/github/img/Dev04.png" width="500px" ></br></br>
- If you ran into trouble, try to [Redeploy](/update/redeploy.md)</br></br>
:::

:::{tab-item} Google Cloud, Docker (Azure, Northflank, Railway, Render)
</br>You don't need to update your GitHub repository.</br></br>
:::

:::{tab-item} Fly.io
</br>You don't need to update your GitHub repository if you deployed from [https://github.com/nightscout/cgm-remote-monitor](https://github.com/nightscout/cgm-remote-monitor).</br></br>
:::


````

</br>

## Step 2: Deploy

````{tab-set}

:::{tab-item} Select your platform ->
</br>
:::

:::{tab-item} Google Cloud
</br>Continue [here](https://navid200.github.io/xDrip/docs/Nightscout/update_nightscout.html)</br></br>
:::

:::{tab-item} Heroku
- Log in Heroku [https://id.heroku.com/login](https://id.heroku.com/login) </br>
</br><img src="/vendors/heroku/img/UpdateNS15.png" width="400px" ></br></br>
- Select your app (hidden in yellow)</br>
</br><img src="/vendors/heroku/img/UpdateNS16.png" width="600px" ></br></br>
- Click on `Deploy`</br>
</br><img src="/vendors/heroku/img/UpdateNS17.png" width="600px" ></br></br>
- Verify Heroku is connected to GitHub, if not, click`Connect to GitHub`</br>
</br><img src="/vendors/heroku/img/UpdateNS18.png" width="800px" ></br></br>
- If Heroku is not connected to GitHub, scroll down and click `Connect to GitHub`, if a popup window opens and requires authorization, click `Authorize Heroku`</br>
</br><img src="/vendors/heroku/img/UpdateNS19.png" width="800px" ></br></br>
- Verify your app `cgm-remote-monitor` is connected to GitHub</br>
</br><img src="/vendors/heroku/img/UpdateNS20.png" width="800px" ></br></br>
- If it isn't, In `Connect to GitHub`, type `cgm-remote-monitor` and click `Search` then click `Connect`</br>
</br><img src="/vendors/heroku/img/UpdateNS21.png" width="800px" ></br></br>
- If you have trouble connecting your app, click `Disconnect` and reconnect it as shown above</br>
</br><img src="/vendors/heroku/img/UpdateNS22.png" width="800px" ></br></br>
- Scroll down to the bottom of the page, select the `master` branch and click `Deploy Branch`</br>
</br><img src="/vendors/heroku/img/UpdateNS23.png" width="800px" ></br></br>
- Build will start and information will scroll in the log window. Do not leave the page, do not interfere and wait for completion. It might take more than 10 minutes.</br>Interrupting the process will lead to a broken site and you'll need to restart deployment.</br>
</br><img src="/vendors/heroku/img/UpdateNS24.png" width="800px" ></br></br>
- Wait until the deploy process completes and click `View` (if nothing happens click `Manage App` then upper right `Open App`)</br>
</br><img src="/vendors/heroku/img/UpdateNS25.png" width="800px" ></br></br>
- Your site will open and should be at the latest version.</br>
- Check your [profile time zone](/nightscout/profile_editor.md#profile-view) is correct. You're done!</br>
If you ran into trouble, try the [Redeploy](/update/redeploy.md) method</br>
:::

:::{tab-item} Azure
- Log into Azure : [https://portal.azure.com/](https://portal.azure.com/)</br>
- Select your App service, your Nightscout site name (you should see it in recent resources)</br>
</br><img src="/vendors/azure/img/Azure42.png" width="600px" /></br></br>
- If you didn't find it, it will show in App Services</br>
</br><img src="/vendors/azure/img/Azure43.png" width="400px" /></br></br>
- In the left menu select Deployment Center and change Continuous Deployment to **On**.</br>
</br><img src="/vendors/azure/img/AzureU02.png" width="800px" /></br></br>
- Click Save (or Discard if you don't want to update).
  Your site will redeploy with the latest cgm-remote-monitor version.  
  Expect a few minutes before it comes back online.</br>
</br><img src="/vendors/azure/img/Dev13.png" width="400px" /></br></br></br>
- You can leave Continuous Deployment On if you want upgrades to happen automatically, or turn it back to Off (and save) to control upgrades manually yourself.
</br>
:::

:::{tab-item} Fly.io
Follow [these instructions](https://fly.io/docs/hands-on/install-flyctl/) to install `flyctl` on your computer. You also need to [install git](https://git-scm.com/downloads) if you're using a Windows computer.</br></br>
*Note for Windows: you might experience issues with Git Bash or PowerShell, try an elevated command prompt.*</br></br>
- Log in Fly.io:</br></br>
`flyctl auth login` </br></br>
- Verify your Nightscout app name, use it to replace `example-ns` in the following lines.</br></br>
`flyctl app list`</br></br>
- Verify your app current region (three letters code) and make sure it's in the [free tier](https://fly.io/docs/reference/regions/#fly-io-regions).</br></br>
`flyctl app list`</br></br>
- Navigate to the `cgm-remote-monitor` folder from which you deployed Nightscout on your computer. Verify it contains the `fly.toml` configuration file you used to deploy your site.</br></br>
  - If you don't see this file, recover it:</br></br>
  `flyctl config save --app example-ns`</br></br>
- If you migrated from Heroku using the wizard, or if you can't find this folder on your computer, follow the next steps to recover your Fly.io configuration:</br></br>
  - Fork a copy of the Nightscout repository and change directory</br></br>
  `git clone https://github.com/nightscout/cgm-remote-monitor`</br></br>
  `cd cgm-remote-monitor`</br></br>
  - Download a default `fly.toml` configuration file</br></br>
  `flyctl config save --app example-ns`</br></br>
- Update your Nightscout repository</br></br>
`git pull`</br></br>
- Edit your `fly.toml` configuration and search this section:</br>
```
[[services]]
  protocol = "tcp"
  internal_port = 8080
  processes = ["app"]
```
- Change the internal port value to 1337, do not change anything else, do not remove the spaces before `internal_port`.</br></br>
`internal_port = 1337`</br></br>
- Save the `fly.toml` file.</br></br>
- Deploy Nightscout:</br></br>
`flyctl launch`</br></br>
- Wait until completion, you site should now be running the latest Nightscout version.</br>
```
Updating existing machines in 'example-ns' with rolling strategy

-------
 ✔ Machine 1781944ae46438 [app] update succeeded
-------

Visit your newly deployed app at https://example-ns.fly.dev/
```
- Downscale the app if you haven't yet
`flyctl scale --app example-ns count 1`
</br>
:::

:::{tab-item} Railway Northflank Render (GitHub)
</br>Once GitHub updated, your Nightscout should automatically deploy with the latest version.</br></br>
:::

:::{tab-item} Northflank (Docker)
</br>- Log into Northflank: [https://app.northflank.com/login](https://app.northflank.com/login)</br>
- Select your Nightscout project</br></br>
<img src="/vendors/northflank/img/Dev14.png" width="600px" /></br></br>
- Select your Nightscout service</br></br>
<img src="/vendors/northflank/img/Dev15.png" width="500px" /></br></br>
- In Overview, Edit deployment</br></br>
<img src="/vendors/northflank/img/Dev18.png" width="800px" /></br></br>
- In the image path, check the image is `nightscout/cgm-remote-monitor:latest` (modify if necessary), then click `Update & rollout restart`</br></br>
<img src="/vendors/northflank/img/Dev19.png" width="600px" /></br></br>
- Your site will redeploy with the latest version.</br></br></br>
:::

:::{tab-item} Railway (Docker)
</br>a) Open [Railway](https://railway.app) and click `login`. Login with GitHub.</br></br>
<img src="/vendors/railway/img/Railway00.png" width="600px" /></br></br>
<img src="/vendors/railway/img/Railway01.png" width="300px" /></br></br>
b) Select your Nightscout project.</br></br>
<img src="/vendors/railway/img/RailwayM15.png" width="500px" /></br></br>
c) Select your Docker service.</br></br>
<img src="/vendors/railway/img/RailwayD05.png" width="300px" /></br></br>
d) Click on `Settings`, disconnect the source image.</br></br>
<img src="/vendors/railway/img/RailwayD09.png" width="500px" /></br></br>
e) Select `Connect image` and type `nightscout/cgm-remote-monitor:latest` then press enter.</br></br>
<img src="/vendors/railway/img/RailwayD10.png" width="500px" /></br></br>
<img src="/vendors/railway/img/RailwayD04.png" width="500px" /></br></br>
f) Go to the `Deployment` tab and from the three dots menu of the top deployment select `Redeploy`.</br></br>
<img src="/vendors/railway/img/RailwayD11.png" width="800px" /></br></br>
- Your site will redeploy with the latest version.</br></br>
:::

:::{tab-item} Render (Docker)
- Log into Render: [https://dashboard.render.com/](https://dashboard.render.com/)</br>
- Select your Nightscout project</br></br>
<img src="/vendors/render/img/Render16.png" width="400px" /></br></br>
- Go to `Settings` and top right expand `Manual Deploy`, Select `Deploy latest reference`</br></br>
<img src="/vendors/render/img/RenderD12.png" width="600px" /></br></br>
- Your site will redeploy with the updated Nightscout version</br>
:::

````

</br>

