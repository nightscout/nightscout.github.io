# Updating Your Site to the Latest Version

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../vendors/img/Heroku.png" style="zoom:80%;" />   <img src="../../vendors/img/railway-app-logo.png" style="zoom:80%;" />  <img src="../../vendors/img/Northflank.png" style="zoom:80%;" /> <img src="../../vendors/img/Azure.png" style="zoom:80%;" /> <img src="../../../vendors/img/flyio-logo.png" style="zoom:80%;" />

------

</br>

[See here which is the current released version](https://github.com/nightscout/cgm-remote-monitor/releases) before updating.

!!!note   
    <img src="../../vendors/img/Heroku.png" style="zoom:80%;" />   
    If you prefer to follow a video, have a look [here](https://www.youtube.com/watch?v=HfPsFdkgnbc).

</br>

## Step 1: Update your repository in GitHub

- You an skip this step if you use Azure

- [Update your current cgm-remote-monitor fork.](../../../nightscout/github/#update-your-nightscout-fork)

- If you have the latest version in GitHub  
  If using Heroku: proceed to [Step 2](#step2-deploy-in-heroku): Deploy  
  If using Railway: your site should be up to date and you're done. If it's not, [reconnect](../../../troubleshoot/railway/#reconnect-github-to-your-project) GitHub.

- If something went wrong continue below.

</br>

#### Use the update script

- Note your GitHub username (hidden below in yellow).
- Scroll down until you see the Nightscout logo. 

<img src="../img/UpdateNS02.png" style="zoom:80%;" >

</br>

- Click `Update your site` 

<img src="../img/UpdateNS03.png" style="zoom:80%;" >

</br>

- Enter your GitHub username and click `Check for updates` 

<img src="../img/UpdateNS04.png" style="zoom:80%;" >

</br>

- If an update is available click `Continue updating at GitHub` 
- Make sure you see `GitHub user located!` else check your username.
- If you know an update is available but you see `Repo is Up to date`, try the alternative method: [redeploy](../redeploy).

<img src="../img/UpdateNS05.png" style="zoom:80%;" >

</br>

- A pop-up will open, just click OK (you can read the contents if you want, but this is explained below, so just click OK)

<img src="../img/UpdateNS06.png" style="zoom:75%;" >

</br>

- Now comes the tricky part.

!!! warning "Don't try to update cgm-remote-monitor with your own project!"
    Make sure the left hand side repository is yours (name hidden in yellow)
    and the right hand side is  `nightscout/cgm-remote-monitor`.

Click `Create pull request`.

<img src="../img/UpdateNS07.png" style="zoom:80%;" >

</br>

- A pull request opens. Last chance to check the left hand side repository is yours (name hidden in yellow) and right hand side is  `nightscout/cgm-remote-monitor`, write a comment in the field (example Update or whatever you like) 

<img src="../img/UpdateNS08.png" style="zoom:80%;" >

</br>

- Scroll down and click `Create pull request` 

<img src="../img/UpdateNS09.png" style="zoom:80%;" >

</br>

- Scroll all the way down (it might be far away) and click `Merge pull request` 

<img src="../img/UpdateNS10.png" style="zoom:80%;" >

<img src="../img/UpdateNS11.png" style="zoom:80%;" >

</br>

- Click `Confirm merge` 

<img src="../img/UpdateNS12.png" style="zoom:80%;" >

</br>

- A new line will appear in the pull requests log showing merge succeeded 

<img src="../img/UpdateNS13.png" style="zoom:80%;" >

</br>

- Your GitHub repository will show you're one commit ahead of the released version 

<img src="../img/UpdateNS14.png" style="zoom:80%;" >

</br>

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../vendors/img/Heroku.png" style="zoom:80%;" /> 

- You have successfully updated your GitHub repository, now let's deploy it in Heroku Step 2 below.

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../vendors/img/railway-app-logo.png" style="zoom:80%;" />   <img src="../../vendors/img/Northflank.png" style="zoom:80%;" />

- You have successfully updated your GitHub repository.  
  You also have completed updating Nightscout as Railway or Northflank will automatically deploy this new version for you.  
  If it's not updated with Railway, [reconnect](../../../troubleshoot/railway/#reconnect-github-to-your-project) GitHub.  
  If something went wrong scroll down and try to redeploy.

</br>

</br>

## Step 2: Deploy in Heroku

</br>

Skip if you don't use Heroku.

</br>

- Log in Heroku [https://id.heroku.com/login](https://id.heroku.com/login) 

!!! note
    Salesforce recommends two-factor-authentication for more Heroku security, starting Feb 2022.  
    For an overview of possible methods see [here](../../vendors/heroku).

</br>

<img src="../img/UpdateNS15.png" style="zoom:80%;" >

</br>

- Select your app (hidden in yellow)

<img src="../img/UpdateNS16.png" style="zoom:80%;" >

</br>

- Click on `Deploy `

<img src="../img/UpdateNS17.png" style="zoom:80%;" >

</br>

- Verify Heroku is connected to GitHub, if not, click `Connect to GitHub`

<img src="../img/UpdateNS18.png" style="zoom:80%;" >

</br>

- If Heroku is not connected to GitHub, scroll down and click `Connect to GitHub `, if a popup window opens and requires authorization, click `Authorize Heroku`

<img src="../img/UpdateNS19.png" style="zoom:80%;" >

</br>

- Verify your app `cgm-remote-monitor ` is connected to GitHub

<img src="../img/UpdateNS20.png" style="zoom:80%;" >

</br>

- If it isn't, In `Connect to GitHub`, type `cgm-remote-monitor ` and click  `Search ` then click `Connect `

<img src="../img/UpdateNS21.png" style="zoom:80%;" >

</br>

- If you have trouble connecting your app, click `Disconnect ` and reconnect it as shown above

<img src="../img/UpdateNS22.png" style="zoom:80%;" >

</br>

- Scroll down to the bottom of the page, select the `master` branch and click `Deploy Branch` 

<img src="../img/UpdateNS23.png" style="zoom:80%;" >

</br>

- Build will start and information will scroll in the log window. Do not leave the page, do not interfere and wait for completion. It might take more than 10 minutes. Interrupting the process will lead to a broken site and you'll need to restart deployment.

<img src="../img/UpdateNS24.png" style="zoom:80%;" >

</br>

- Wait until the deploy process completes and click `View ` (if nothing happens click `Manage App` then upper right `Open App`)

<img src="../img/UpdateNS25.png" style="zoom:80%;" >

</br>

- Your site will open and should be at the latest version. 
- Check your [profile time zone](../../nightscout/profile_editor/#profile-view) is correct. You're done!

</br>

If you ran into trouble, try the [Redeploy](./redeploy.md) method

</br>

</br>

## Step 2: Deploy in Azure

</br>

Skip if you don't use Azure.

</br>

- Log into Azure : [https://portal.azure.com/](https://portal.azure.com/)
- Select your App service, your Nightscout site name (you should see it in recent resources)

<img src="../../../vendors/azure/img/Azure42.png" style="zoom:80%;" />

- If you didn't find it, it will show in App Services

<img src="../../../vendors/azure/img/Azure43.png" style="zoom:80%;" />

- In the left menu select Deployment Center and change Continuous Deployment to **On**.

<img src="../../../vendors/azure/img/AzureU02.png" style="zoom:80%;" />

- Click Save (or Discard if you don't want to update).  
  Your site will redeploy with the latest cgm-remote-monitor version.  
  Expect a few minutes before it comes back online.

<img src="../img/Dev13.png" style="zoom:80%;" /></br>

- You can leave Continuous Deployment On if you want upgrades to happen automatically, or turn it back to Off (and save) to control upgrades manually yourself.

</br>

## Step 2: Deploy in Fly.io

</br>

!!!warning "Site maintainability"  
    Make sure you have a local fork of `cgm-remote-monitor` and the current fly.toml before continuing.  
    If you don't, first perform [these operations](../../../troubleshoot/fly.io/#make-your-migrated-app-maintainable).

a) Open a PowerShell (Windows) or a terminal (OSX/Linux), and type:

```
cd cgm-remote-monitor
```

</br>

b) Update your local fork

```
git pull origin master
```

</br>

c) Deploy the changes.

Type the command:

```
flyctl deploy
```

Deploy will take some time and should complete with the message `1 desired, 1 placed, 1 healthy, 0 unhealthy [health checks: 1 total, 1 passing]`.

</br>