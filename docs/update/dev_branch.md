In rare occasions, like testing a specific fix or a feature that is not released yet (i.e. not in the `master` branch) you might need to deploy another branch like `dev` in the example below.

Do not deploy `dev` or a branch other than `master` unless directed to do so (except if you know why you are doing so).

## Step 1: Update your repository in GitHub

- Skip this step if you're using Azure.
- Click here to log in at GitHub: [https://github.com/login](https://github.com/login).
- Enter your username or email and your password. Click `Sign in`

<img src="../img/UpdateNS00.png" style="zoom:80%;" >

</br>

- Select your own `cgm-remote-monitor` project (**not `nightscout/cgm-remote-monitor`**)

<img src="../img/UpdateNS01.png" style="zoom:80%;" >

</br>

- Your repository will open. 

<img src="../img/Dev00.png" style="zoom:80%;" >

- In the branch drop down menu (normally showing `master`) select  `dev`

<img src="../img/Dev01.png" style="zoom:90%;" >

</br>

- Click`Fetch upstream` to update it, then  `Fetch and merge`

<img src="../img/Dev03.png" style="zoom:80%;" >

</br>

- After a moment, your repository should display `This branch is up to date with nightscout:dev`
- If you ran into trouble, try to [Redeploy](./redeploy.md).

If you're using Railway to host your Nightscout site you need to perform the following steps:

<img src="../img/Dev04.png" style="zoom:80%;" >

- Go to `Settings`

<img src="../img/UpdateNS26.png" style="zoom:80%;" >

- Click on `Branches`, in `Default Branch` click the arrow and select the branch you want to deploy by default.

<img src="../img/Dev09.png" style="zoom:80%;" >

- Click on the current branch (example below: `master`) and select the one you want as a default (example below: `dev`) then select `Update`.

<img src="../img/Dev10.png" style="zoom:80%;" >

- Confirm you will use the new selected branch as default.

<img src="../img/Dev11.png" style="zoom:80%;" >

- You have now changed the default branch to dev.

</br>

## Step 2a: Deploy in Heroku

- Skip this step for other platforms
- Log in Heroku [https://id.heroku.com/login](https://id.heroku.com/login) 

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

- Scroll down to the bottom of the page, select the `dev` branch and click `Deploy Branch` 

<img src="../img/Dev05.png" style="zoom:80%;" >

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

## Step 2b: Deploy in Railway

- Skip this step for other platforms

- Open [Railway](https://railway.app) and click `login`. Login with GitHub.


<img src="../../../vendors/railway/img/Railway00.png" style="zoom:80%;" />

<img src="../../../vendors/railway/img/Railway01.png" style="zoom:80%;" />

</br>

- Select your Nightscout project.


<img src="../../../vendors/railway/img/RailwayM15.png" style="zoom:80%;" />

</br>

- Select your web app.


<img src="../../../vendors/railway/img/RailwayM16.png" style="zoom:80%;" />

</br>

- Still in `Settings` look at `Environment`.  

- Change the `Deployment Trigger` with `dev` (it was showing `master`).

<img src="../img/Dev07.png" style="zoom:80%;" />

- If you only see `master` in the list you need to [delete and fork your Nightscout repository in GitHub](../../update/redeploy/#step-1-cleanup-github) **taking care to select all branches when you reach the following step!**.  
  <img src="../img/Dev06.png" style="zoom:80%;" />  
  Then 

- Once `dev` selected Railway will deploy automatically.

</br>

## Step 2c: Deploy in Northflank

- Skip this step for other platforms

- Log into Northflank: [https://app.northflank.com/login](https://app.northflank.com/login)

- Select your Nightscout project

<img src="../img/Dev14.png" style="zoom:80%;" />

- Select your Nightscout service

<img src="../img/Dev15.png" style="zoom:80%;" />

- Click on the pen icon after the current branch (example below: `master`)

<img src="../img/Dev16.png" style="zoom:80%;" />

- In the branch list, select the version you want to deploy, then click `Update Build Source`

<img src="../img/Dev17.png" style="zoom:80%;" />

- Your site will redeploy with the selected branch

</br>

## Step 2d: Deploy in Azure

- Log into Azure : [https://portal.azure.com/](https://portal.azure.com/)
- Select your App service, your Nightscout site name (you should see it in recent resources)

<img src="../../../vendors/azure/img/Azure42.png" style="zoom:80%;" />

- If you didn't find it, it will show in App Services

<img src="../../../vendors/azure/img/Azure43.png" style="zoom:80%;" />

- In the left menu select Deployment Center, in Full Image Name and Tag change the version to:

```
nightscout/cgm-remote-monitor:latest_dev
```

<img src="../img/Dev12.png" style="zoom:80%;" />

- Click Save (or Discard if you don't want to save).  
  Your site will redeploy if you changed the configuration. Expect a few minutes before it comes back online.

<img src="../img/Dev13.png" style="zoom:80%;" />

</br>

</br>

## How to return to the `master` release

If things don't go as expected you can simply redeploy your `master` branch performing the same steps and using `master` instead of `dev`.

When the dev branch gets merged into release, just follow the [classic update method](./update.md).

</br>