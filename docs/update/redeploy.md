# Redeploy your repository

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../vendors/img/Heroku.png" style="zoom:80%;" />  and <img src="../../vendors/img/railway-app-logo.png" style="zoom:80%;" />

------

</br>

!!!warning "Multiple apps and accounts linked to one Github"
    If you delete and redeploy you might need to connect again `cgm-remote-monitor`. Automatic deploy might not be maintained after a redeploy.

</br>

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../vendors/img/Heroku.png" style="zoom:80%;" />

!!!note "If you prefer to follow a video"
    Use [this one](https://youtu.be/C0edTQhO21g).

<br>

## Step 1. Cleanup Github

</br>

- [Delete your current cgm-remote-monitor fork.](../../../nightscout/github/#delete-your-own-fork-of-cgm-remote-monitor)

- [Fork the current Nightscout cgm-remote-monitor project](../../../nightscout/github/#fork-the-nightscout-project).

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../vendors/img/Heroku.png" style="zoom:80%;" /> 

- You have successfully updated your GitHub repository, now let's deploy it in Heroku Step 2 below.

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../vendors/img/railway-app-logo.png" style="zoom:80%;" />

- You have successfully updated your GitHub repository.  
  You will need to reconnect your cgm-remote-monitor project to Railway.  
  You also have completed updating Nightscout as Railway will automatically deploy this new version for you.  
  
  </br>

## Step 2: Deploy in Heroku

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

- Type `cgm-remote-monitor ` and click  `Search ` then click `Connect `

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
- Check your [profile time zone](../../nightscout/profile_editor/#profile-view) is correct.
- You're done!



