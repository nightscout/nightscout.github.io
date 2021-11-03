# Redeploy your repository

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../vendors/img/Heroku.png" style="zoom:80%;" />

------

</br>

!!! note "Azure Users"
    As of 0.12, Nightscout no longer readily supports the free Azure platform. It is recommended that you [create a new site with Heroku](../../nightscout/new_user/).

</br>

!!!warning "Multiple Heroku apps and accounts linked to one Github"
    If you delete and redeploy you might need to connect again `cgm-remote-monitor`. Automatic deploy might not be maintained after a redeploy.

</br>

!!!note "If you prefer to follow a video"
    Use [this one](https://youtu.be/C0edTQhO21g).

<br>

## Step 1. Cleanup Github

</br>

- Click here to log in at GitHub: [https://github.com/login](https://github.com/login).
- Enter your username or email and your password. Click `Sign in`

<img src="../img/UpdateNS00.png" style="zoom:80%;" >

</br>

- Select your own `cgm-remote-monitor` project (not `nightscout/cgm-remote-monitor`)

<img src="../img/UpdateNS01.png" style="zoom:80%;" >

</br>

Click `Settings`

<img src="../img/UpdateNS26.png" style="zoom:80%;" >

</br>

Scroll down to `Danger zone` and click `Delete this repository`

<img src="../img/UpdateNS27.png" style="zoom:80%;" >

</br>

Copy and paste your full repository name to confirm then click `I understand...`

<img src="../img/UpdateNS28.png" style="zoom:80%;" >

</br>

- Click this link to go to the official repository: [https://github.com/nightscout/cgm-remote-monitor](https://github.com/nightscout/cgm-remote-monitor)

- Click on `Fork`

<img src="../img/UpdateNS29.png" style="zoom:80%;" >

</br>

- Wait for completion then leave GitHub open.

<img src="../img/UpdateNS30.png" style="zoom:80%;" >

</br>

## Step 2: Deploy in Heroku

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



