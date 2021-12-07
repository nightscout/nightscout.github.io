<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../vendors/img/Heroku.png" style="zoom:80%;" />

In rare occasions, like testing a specific fix or a feature that is not released yet (i.e. not in the `master` branch) you might need to deploy another branch like `dev` in the example below.

Do not deploy `dev` or a branch other than `master` unless directed to do so (except if you know why you are doing so).

## Step1: Update your repository in GitHub

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

<img src="../img/Dev04.png" style="zoom:80%;" >

- If you ran into trouble, try to [Redeploy](./redeploy.md).

</br>

## Step2: Deploy in Heroku

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

## How to return to the `master` release

If things don't go as expected you can simply redeploy your master branch selecting it in the drop down menu:

<img src="../img/UpdateNS23.png" style="zoom:80%;" >

When the dev branch gets merged into release, just follow the [classic update method](./update.md).