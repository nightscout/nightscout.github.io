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

```{tab-set}

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
- ***Site maintainability***</br>
Perform [these operations](/troubleshoot/fly.io.md#make-your-migrated-app-maintainable).
</br></br>
Your deployment will update automatically.
</br>
:::

:::{tab-item} Railway Northflank Render
</br>Once GitHub updated, your Nightscout should automatically deploy with the latest version.</br></br>
:::

:::{tab-item} Google Cloud
</br>Continue [here](https://navid200.github.io/xDrip/docs/Nightscout/update_nightscout.html)</br></br>
:::

```

</br>