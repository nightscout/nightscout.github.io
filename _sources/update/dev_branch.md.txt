# Deploy another version

If you need to return to the previous Nightscout version, or in rare occasions, like testing a specific fix or a feature that is not released yet (i.e. not in the `master` branch), you might need to deploy another branch like `dev` in the example below.

Do not deploy `dev` or a branch other than `master` unless directed to do so (except if you know why you are doing so).

## Step 1: Update your repository in GitHub

Select your platform below:

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
- After a moment, your repository should display `This branch is up to date with nightscout:dev`</br></br>
<img src="/vendors/github/img/Dev04.png" width="500px" ></br></br>
- If you ran into trouble, try to [Redeploy](/update/redeploy.md) (and this is **mandatory** if you don't see `dev` in GitHub.)</br></br>
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

Select your platform below:

````{tab-set}

:::{tab-item} Select your platform ->
</br>
:::

:::{tab-item} Google Cloud
[Here](https://navid200.github.io/xDrip/docs/Nightscout/Customize.html)</br>
:::

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

:::{tab-item} Railway (GitHub)
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
e) Select `Connect image` and replace `nightscout/cgm-remote-monitor:latest` with the [version](https://hub.docker.com/r/nightscout/cgm-remote-monitor/tags) you want to deploy (for example `nightscout/cgm-remote-monitor:latest_dev`).</br></br>
<img src="/vendors/railway/img/RailwayD10.png" width="500px" /></br></br>
<img src="/vendors/railway/img/RailwayD04.png" width="500px" /></br></br>
f) On the top left of the screen `Deploy`.</br></br>
<img src="/vendors/railway/img/RailwayD06.png" width="800px" /></br></br>
- Your site will redeploy with the latest version.</br></br>
:::

:::{tab-item} Northflank (GitHub)
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

:::{tab-item} Northflank (Docker)
- Log into Northflank: [https://app.northflank.com/login](https://app.northflank.com/login)</br>
- Select your Nightscout project</br></br>
<img src="/vendors/northflank/img/Dev14.png" width="600px" /></br></br>
- Select your Nightscout service</br></br>
<img src="/vendors/northflank/img/Dev15.png" width="500px" /></br></br>
- In Overview, Edit deployment</br></br>
<img src="/vendors/northflank/img/Dev18.png" width="800px" /></br></br>
- In the image path, replace `nightscout/cgm-remote-monitor:latest` with the [version](https://hub.docker.com/r/nightscout/cgm-remote-monitor/tags) you want to deploy (for example `nightscout/cgm-remote-monitor:latest_dev`), then click `Update & rollout restart`</br></br>
<img src="/vendors/northflank/img/Dev19.png" width="600px" /></br></br>
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
Or whichever version (change `filter tag` find the version) in the [list](https://hub.docker.com/r/nightscout/cgm-remote-monitor/tags).</br></br>
`nightscout/cgm-remote-monitor:14.2.6`	(example for 14.2.6)</br></br>
<img src="/vendors/azure/img/Dev12.png" width="600px" /></br></br>
- Click Save (or Discard if you don't want to save).</br>
  Your site will redeploy if you changed the configuration. Expect a few minutes before it comes back online.</br></br>
<img src="/vendors/azure/img/Dev13.png" width="400px" /></br></br>
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
`git config pull.rebase true`</br></br>
`git pull origin dev`</br></br>
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
- Don't forget to downscale the app if you haven't yet!</br></br>
`flyctl scale --app example-ns count 1`</br></br>
</br>
:::

:::{tab-item} Render (Docker)
- Log into Render: [https://dashboard.render.com/](https://dashboard.render.com/)</br>
- Select your Nightscout project</br></br>
<img src="/vendors/render/img/Render16.png" width="400px" /></br></br>
- Go to `Settings` and scroll down to `Deploy`. Edit the URL of the image deployed</br></br>
<img src="/vendors/render/img/RenderD10.png" width="600px" /></br></br>
- Change it to:</br></br>
`nightscout/cgm-remote-monitor:latest_dev`	(example for dev)</br>
Or whichever version (change `filter tag` find the version) in the [list](https://hub.docker.com/r/nightscout/cgm-remote-monitor/tags).</br>
`nightscout/cgm-remote-monitor:14.2.6`	(example for 14.2.6)</br></br>
<img src="/vendors/render/img/RenderD11.png" width="600px" /></br></br>
- Click `Save changes`.</br></br>
- Your site will redeploy with the selected branch</br>
:::

````

</br>

Check your [profile time zone](/nightscout/profile_editor.md#profile-view) is correct. You're done!

</br>

</br>

## How to return to the `master` release

If things don't go as expected you can simply redeploy your `master` branch performing the same steps and using `master` instead of `dev`.

When the dev branch gets merged into release, just follow the [classic update method](/update/update.md).

</br>