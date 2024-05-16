# Update Nightscout

```{tip}
You don't need to follow these instructions if you use a hosted service.</br>Contact the vendor to learn more about possible updates.
```

</br>

[See here which is the current released version](https://github.com/nightscout/cgm-remote-monitor/releases) before updating.

</br>

## Step 1: Update your repository in GitHub

```{tip}
Skip this step if you're using Azure, Google Cloud xDrip+ scripted deployment or Fly.io from the orignal `cgm-remote-monitor` repository.
```

Follow [these instructions](/vendors/github/update/) and come back.

</br>

## Step 2: Deploy

````{tab-set}

:::{tab-item} Select your platform ->
</br>
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

:::{tab-item} Railway Northflank Render
</br>Once GitHub updated, your Nightscout should automatically deploy with the latest version.</br></br>
:::

:::{tab-item} Google Cloud
</br>Continue [here](https://navid200.github.io/xDrip/docs/Nightscout/update_nightscout.html)</br></br>
:::

````

</br>

