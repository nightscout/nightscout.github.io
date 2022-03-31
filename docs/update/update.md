# Updating Your Site to the Latest Version

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../vendors/img/Heroku.png" style="zoom:80%;" />

------

</br>

[See here which is the current released version](https://github.com/nightscout/cgm-remote-monitor/releases) before updating.

!!!note   
    If you prefer to follow a video, have a look [here](https://www.youtube.com/watch?v=HfPsFdkgnbc).

</br>

## Requirements

</br>

This version of Nightscout will probably not run on anything older than these versions/platforms:

* Android 4
* iOS 9
* Chrome 68
* Edge 17
* Firefox 61
* Safari 10 (macOS 10.12)
* Opera 54
* Internet Explorer: none

</br>

## Azure Users

As of 0.12, Nightscout no longer readily supports the free Azure platform. It is recommended that you [create a new site with Heroku](../../nightscout/new_user/).

</br>

## Step1: Update your repository in GitHub

</br>

- Click here to log in at GitHub: [https://github.com/login](https://github.com/login).
- Enter your username or email and your password. Click `Sign in`

<img src="../img/UpdateNS00.png" style="zoom:80%;" >

</br>

- Select your own `cgm-remote-monitor` project (**not `nightscout/cgm-remote-monitor`**)

<img src="../img/UpdateNS01.png" style="zoom:80%;" >

</br>

- Your repository will open. If you see `This branch is xxx commits behind nightscout:master` you need to update.
- Select `Fetch upstream`

<img src="../img/UpdateNS01a.png" style="zoom:80%;" >

</br>

- Select `Fetch and merge`

<img src="../img/UpdateNS01b.png" style="zoom:80%;" >

</br>

- After a moment, your repository should display `This branch is up to date with nightscout:master`

<img src="../img/UpdateNS01c.png" style="zoom:80%;" >

- You have now updated your GitHub repository, proceed to [Step 2](#step2-deploy-in-heroku): Deploy in Heroku
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

- You have successfully updated your GitHub repository, now let's deploy it in Heroku.

</br>

</br>

## Step2: Deploy in Heroku

</br>

- Log in Heroku [https://id.heroku.com/login](https://id.heroku.com/login) 

!!! note
    Salesforce requires two-factor-authentication for more Heroku security, this is mandatory starting Feb 2022. For an overview of possible methods see [here](../../vendors/heroku).

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

Else...

# Redeploy

- If you ran into trouble, try the [Redeploy](./redeploy.md) method