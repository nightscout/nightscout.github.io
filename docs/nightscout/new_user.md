

# New Nightscout Users

</br>

Nightscout is DIY, if you don’t feel confident you’ll have necessary skills, give it a try, you’ll find open heart people ready to help you building it in many Facebook groups. For free. Paying it forward.

Here is a step-by-step guide for completing your own Nightscout site DIY style.

</br>

Create your Heroku, GitHub and Atlas accounts from a computer.

Do not change device/computer/browser during the creation process!

If you have issues with your current browser try another one.</br></br>


## Step 1: Create a GitHub account

</br>

- Click this link to create a GitHub account: [https://github.com/](https://github.com/)
- Enter a username (anything you want and that is accepted, not very important), email, and password.
- Then click `Sign up for GitHub`

![](..\img\NewNS00.png)

</br>

- Play and solve the puzzle then click `Join a free plan`.

![](..\img\NewNS01.png)

</br>

- Select whatever choices (not important) then click `Complete setup`.



![](..\img\NewNS02.png)

</br>

- GitHub will send you a verification email, open your mailbox and check for it (look into spam also).

![](..\img\NewNS03.png)

</br>

- On the received email, click `Verify email address`.

![](..\img\NewNS04.png)

</br>



- A new page will open in your browser, click `Skip this for now`.

![](..\img\NewNS05.png)

</br>

- Leave the page open as it is.

![](..\img\NewNS06.png)

</br></br>

## Step 2: Create a Heroku account

</br>

- Click this link to create an Heroku account: [https://signup.heroku.com/login](https://signup.heroku.com/login)

- Enter mandatory data (*) and click `CREATE FREE ACCOUNT`

![](..\img\NewNS07.png)

</br>

- Heroku will send a confirmation email, open your mailbox and look for it (also check spam folder).

![](..\img\NewNS09.png)

</br>

- Click on the activation link

![](..\img\NewNS10.png)

</br>

- Create a password an write it down. Click `SET PASSWORD AND LOG IN`

![](..\img\NewNS11.png)

</br>

- Click `CLICK HERE TO PROCEED`

![](..\img\NewNS12.png)

</br>

- Your Heroku page will open, click on your profile picture top right and select `Account Settings`

![](..\img\NewNS13.png)

</br>

- Click on `Billing`

![](..\img\NewNS14.png)

</br>

- Click `Add credit card`

![](..\img\NewNS15.png)

</br>

- Enter a valid credit card information and click `Save Details`

!!! note "Note"
    Unless you voluntarily select billable features, your credit card information is only used for verifications and you will not be charged anything. Worst case you’ll be charged $0.00</br>

![](..\img\NewNS16.png)

</br>

- You should now have 2 pages open: Heroku and GitHub. Leave them open.</br></br>

## Step 3: Create an Atlas account

</br>

- Open another tab at: [https://www.mongodb.com/cloud/atlas](https://www.mongodb.com/cloud/atlas) and click `Start Free`



![](..\img\NewNS17.png)

</br>

- Enter information then click `Get Started Free`

![](..\img\NewNS18.png)

</br>

- Select `Create a cluster in Shared Clusters (FREE)`

![](..\img\NewNS19.png)

</br>

- Leave all default values and click `Create Cluster`

![](..\img\NewNS20.png)

</br>

Atlas will create your default cluster, wait until completion… (can take more than 3 minutes)

![](..\img\NewNS21.png)

</br>

- Click on `CONNECT`

![](..\img\NewNS22.png)

</br>

- Click on `Allow Access from Anywhere`

![](..\img\NewNS23.png)

</br>

- Click on `Add IP Address`

![](..\img\NewNS24.png)

</br>

- Add a username (for example nightscout) and a password. Write down this information, you’ll need it later.
- Then click `Create Database User`.

![](..\img\NewNS25.png)

</br>

- Click on `Choose a connection method`

![](..\img\NewNS26.png)

</br>

- Select `Connect your application`

![](..\img\NewNS27.png)

</br>

- Copy the connection string: click `Copy` and paste it somewhere to edit it (like Notepad).

![](..\img\NewNS28.png)

</br>

- Modify the connection string:

 It should be similar to this (`xxxxx` will be different):



`mongodb+srv://nightscout:<password>@cluster0.xxxxx.mongodb.net/<dbname>?retryWrites=true&w=majority`

- Replace <password> with your password as noted previously and <dbname> by any text you want, say mycgmic for example. The result will be like this:

`mongodb+srv://nightscout:soo5ecret@cluster0.xxxxx.mongodb.net/mycgmic?retryWrites=true&w=majority`

 

Note: there are no < and > characters in the final string, neither for password and database name.

Keep this string safely aside, it is called your `MONGODB_URI`

</br></br>



## Step 4: Fork and deploy cgm-remote-monitor

</br>

- You should now have three pages opened in your browser: Heroku, Atlas and Github, make sur each one is logged in
   (i.e. not asking you to login) before you continue.

- Click this link [https://github.com/nightscout/cgm-remote-monitor](https://github.com/nightscout/cgm-remote-monitor), a new GitHub page will open. Click on `Fork`

  

  ![](..\img\NewNS29.png)

  </br>

- Wait a moment

![](..\img\NewNS30.png)

</br>

- Scroll down and click `Deploy to Heroku`

![](..\img\NewNS31.png)

![](..\img\NewNS32.png)

</br>

!!! note "You're getting into the core setup of your site"
    Below you'll see the minimum required configuration, you can modify the variables later in Heroku. A more complete list here: [Setup](..\setup_variables)

</br>

- Enter your CGM in the Cloud site name: invent a name you will use to see your BG in the cloud. Check the name is available.

- Don’t change the region.

![](..\img\NewNS33.png)

</br>

Scroll down and setup the following variables:

 </br>

- `API_SECRET` will be your Nightscout site password, it needs to be at least 12 characters long and should **NOT use spaces and @ or ! symbols**.

![](..\img\NewNS34.png)

</br>

- If you want to link your Dexcom Share account as a data source, compile the following lines:

![](..\img\NewNS35.png)

</br>

!!!info "MOST COMMON ERRORS"
    The `BRIDGE_PASSWORD` and `BRIDGE_USER_NAME` are NOT visible from within your Dexcom app or online account. The values for them are what you entered into your Dexcom mobile app when you VERY FIRST logged into that app however long ago. The `BRIDGE_USER_NAME` is not an email address. The most common error on initial Nightscout setups is that people incorrectly use an old account or an old password. To test your username and password, go to Dexcom's Clarity page (check [here for USA accounts](https://clarity.dexcom.com) and [here for the others](https://clarity.dexcom.eu)) and try logging into your Dexcom account. If your account info doesn't let you in, or you don't see data in your Clarity account...then you need to figure out your actual credentials before moving ahead.

!!! note "Password"
    *Some people have had problems with their bridge connecting when their Dexcom passwords are entirely numeric. If you have connection issues in that case, try changing your password to something with a mix of numbers and letters.*

</br>

- If you want to link your CareLink account as a data source, compile the following lines:

![](..\img\NewNS36.png)

</br>

- Select the units you’re using in `DISPLAY_UNITS` acceptable choices are `mg/dl` or `mmol/L` (or just `mmol`).

![](..\img\NewNS37.png)

</br>

- In `ENABLE` copy and paste the following words (separated by a space) so that won't have to think about which you want now:

`careportal` `basal` `dbsize` `rawbg` `iob` `maker` `bridge` `cob` `bwp` `cage` `iage` `sage` `boluscalc` `pushover` `treatmentnotify` `mmconnect` `loop` `pump` `profile` `food` `openaps` `bage` `alexa` `override`

![](..\img\NewNS38.png)

!!! note "More on `ENABLE` words"
    If you want to know more about them, look here: [Setup](..\setup_variables)

</br>

- Now you need that connection string you defined during the Atlas cluster creation (as the example below, but not the string below). Copy and paste it in the `MONGODB_URI` variable field.

`mongodb+srv://nightscout:soo5ecret@cluster0.xxxxx.mongodb.net/mycgmic?retryWrites=true&w=majority`

![](..\img\NewNS39.png)

</br>

- Browse down to the end of the list and click `Deploy app`

![](..\img\NewNS40.png)

</br>

- **WAIT** until completion (will take some time). Do not interfere with the process until it's complete.

![](..\img\NewNS41.png)

</br>

- Then click `View`

![](..\img\NewNS42.png)

</br>

- Your Nightscout site should open, click on the hamburger menu top right and select `Profile Editor`.

![](..\img\NewNS43.png)

</br>

- Setup your `Time zone` and eventually all other fields. Do not leave empty fields. If you don't know which value you should use, just leave default. You can change them later.

![](..\img\NewNS44.png)

</br>

- Browse down to `Authentication status` and click `Authenticate`. Enter your API secret. Click `Update`.

![](..\img\NewNS45.png)

</br>

- Click `Save`.

![](..\img\NewNS46.png)

</br>

- If the following pop-up shows up click `OK`, and check status (upper right of the window).

![](..\img\NewNS47.png)

</br>

- Dexcom Share and CareLink users should see data flowing in after some minutes, other uploaders like xDrip+, Spike, xDrip4iOS, etc will need to be setup with the Nightscout address and API secret in the app.

![](..\img\NewNS48.png)

</br>

- Finally, you might want to modify the `PAPERTRAIL_API_TOKEN` line. Heroku offers a free, tiny amount of Papertrail service (like a logging service for how the site is running), but really generates more confusion to most people later when they get a message that their "Free Papertrail Service has run out of room". Papertrail is not needed, edit the line and add `DISABLED` at the end, so that you can recover the function should you need it.

![](..\img\NewNS49.png)

</br></br>



## Step 5: Uploader setup

</br>

Most uploaders require your Nightscout URL and the API secret.

For xDrip+ you need to put the URL in this format:

`https://APISecret@SiteURL.herokuapp.com/api/v1`



