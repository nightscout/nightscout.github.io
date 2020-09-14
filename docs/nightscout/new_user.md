# New Nightscout Users

There are two options for setting up Nightscout; one option requires a small fee but automates both the setup and periodic updating/cleaning database, the other option is free but requires your effort to build and update. You choose which works best for you. Isn't it nice to have options?

## T1Pal (paid service)

[T1Pal is only dedicated NS hosting](https://t1pal.com/) company.  There is a hosting fee required which is used to help ensure Nightscout runs without limits and receives improvements.  Setup is simple and plugins are configured automatically during the setup guide.

* Select [Get Started](https://www.t1pal.com/getting-started/starting/home) to register an account at [T1Pal](https://www.t1pal.com/).  You will need to enter your credit card, which helps ensure Nightscout is running correctly.

<p align="center">
<img src="../img/t1pal_configure.png" width="450">
</p>

## Traditional DIY (free, do-it-yourself)

Two options exist for easy DIY hosting of NS; Azure or Heroku. Both hosting services are free. However, Azure has data quotas monthly and shorter-term CPU quotas, so you're very likely to hit problems with Azure and we recommend choosing Heroku. If you host at Azure and exceed those quotas, you may be facing a monthly data-use bill or being locked out of NS for about 12 hours until the quotas reset. As you start to use NS more intensively for alarms, pebble watches, etc…it is possible that you may exceed your monthly data cap on Azure. Many users have transitioned their old sites from Azure over to Heroku and have found the hosting change to be beneficial. Therefore, we recommend new users start with Heroku.

If you are the person who enjoys videos...here's a YouTube video that you can use to walk-through with these directions. Just give it a click.

<p align="center">
<a href="https://youtu.be/5WREY465eII" target="_blank"><img src="../img/thumbnail.png" width="650" title="How to build a Nightscout site: Loop Users" /></a>
</p>

If you don't enjoy videos, then here is a step-by-step guide for completing your own Nightscout site DIY style.


## Step 1: MongoDB Atlas Account

Create an account at <a href="https://www.mongodb.com/cloud/atlas/register" target="_blank">MongoDB Atlas's signup page</a>.

You are creating this account for your personal use and not for a company so you can use your name in the Company Name field. The same applies for the Work Email field. Click on the "Get Started Free" button.


<p align="center">
<img src="../img/atlas1.png" width="450">
</p>

Now, you want to create a free shared cluster. Do that by clicking on the "Create a cluster" button under "Shared Clusters".

<p align="center">
<img src="../img/atlas2.png" width="450">
</p>

During this step, you are now asked to configure the Cloud Provider and Region for your new cluster. Leaving the defaults is fine. Do not change these settings. The selected Cluster Tier should be "M0 Sandbox". This is is the Free tier.

<p align="center">
<img src="../img/atlas3.png" width="450">
</p>

Now, at the bottom of the page, you may name your cluster. Leaving the default is okay, but feel free to rename it to "nightscout" to make things clearer and avoid errors in the future.

<p align="center">
<img src="../img/atlas4.png" width="450">
</p>

Finally, you can click on the "Create Cluster" buttom at the bottom right of the page.

<p align="center">
<img src="../img/atlas5.png" width="450">
</p>

You will be brought to a page with a lot of information about your cluster. At first, it should say "Your cluster is being created...". We cannot continue until this is done, so lets wait a little bit.

<p align="center">
<img src="../img/atlas6.png" width="450">
</p>

Once cluster creation is complete, click on the small "Connect" button. This will bring up a new form.

<p align="center">
<img src="../img/atlas7.png" width="450">
</p>

The first thing you need to do is to allow access to your cluster from anywhere. Do that by clicking on "Allow Access from Anywhere". Then, leave the defaults and click on "Add IP Address".

<p align="center">
<img src="../img/atlas8.png" width="450">
</p>

Now, you need to create a database user for Nightscout to access your cluster. Do that by entering a username and password in the form below. Feel free to use "nightscout" as a username. Please use a secure password. You may use click on "Autogenerate Secure Password" to generate one for you. **Make sure to note down the username and password that you have entered.** They will be required when setting up your Nightscout site.

<p align="center">
<img src="../img/atlas9.png" width="450">
</p>

Now, click on "Choose a connection method" at the bottom of the form. Then, click on "Connect your application". Leave the default Driver and version and copy the displayed string. You can copy the string by clicking on the "Copy" button. This is is the last piece of information that we need from MongoDB Atlas.

Before doing anything else, you need to replace some information in the string and note it down.

<p align="center">
<img src="../img/atlas10.png" width="450">
</p>

For example, my string was ``mongodb+srv://nightscout:<password>@nightscout.ztlke.mongodb.net/<dbname>?retryWrites=true&w=majority``. I need to change ``<password>`` to my password and ``<dbname>`` to anything I like. The final result would be ``mongodb+srv://nightscout:password123@nightscout.ztlke.mongodb.net/nightscout?retryWrites=true&w=majority``. This string contains all the information that Nightscout needs to connect to your newly connected cluster. Note it down and it will be required during the Heroku setup. This will be known as your **MONGODB_URI**.

## Step 2: Heroku Account

Create an account at <a href="https://signup.heroku.com/login" target="_blank">Heroku's signup page</a>. 

Enter your name, email address, role ("Hobbyist" is fine) and choose "Node.js" as the Primary Development Language.  When you get all those entered, confirm that you are not a robot and click the blue "Create Free Account" button

<p align="center">
<img src="../img/heroku1.png" width="450">
</p> 

Now follow the directions and check your email to confirm your Heroku account. You'll be asked to create a password...save that password somewhere secure! You'll likely be logging into Heroku in the future, so this is a good password to save. If you're not using a password manager yet, we recommend getting one - this makes it much easier to use safe passwords that are unique across sites. Our favorite password manager is 1Password, which is both secure and very easy to use.

When you finish creating the password, you'll see a screen like below.

<p align="center">
<img src="../img/heroku2.png" width="450">
</p> 

We have to complete one last step...adding a credit card to your Heroku account. Don't worry, Heroku is still free...but it's only free if you leave a credit card on file. I've used Heroku for 6 years now and never been charged.

To add your credit card, click on the icon of a little ninja person in the upper right corner of the Heroku site, and then select Account Settings and then Billing...or <a href="https://dashboard.heroku.com/account/billing" target="_blank">this should take you right to the billing page for your account</a>. Then click the purple "Add credit card" button. Finish the steps to add a credit card.

<p align="center">
<img src="../img/heroku3.png" width="450">
</p> 

Once you finish that, you can just leave that page/tab alone and move on down to the next step below. 

## Step 3: Create an account at GitHub

Go to <a href="https://github.com/join" target="_blank">GitHub's signup page</a>. Fill out the information to create your own unique username (write it down), email address, and password (also write this one down). Verify that you are a real person by tossing an animal's image around until it is upright...and then you'll be able to click the green "create an account" at the bottom of the page

<p align="center">
<img src="../img/github1.png" width="450">
</p> 

Github will then ask if you want the Free Account (duh, yes). Confirm that (and unclick the Newsletter subscription if you don't want spam).

Finally, Github will ask you a little about your programming experience and what you are going to use GitHub for...you can answer those or choose the "skip this step" option at the bottom of the screen.

Finally, you'll be sent the email to verify your new account. Go to your emails and click the link sent to you.

## Step 4: Fork and deploy cgm-remote-monitor

Now go to the <a href="https://github.com/nightscout/cgm-remote-monitor" target="_blank">Nightscout cgm-remote-monitor repository</a>. This is where the Nightscout developer's store their code that we are going to borrow a copy of. A copy of code in Github is called a "fork". In the upper right corner, you'll find a little button labeled `Fork`.  Click that button and you'll see a message that GitHub is cloning/forking a copy of that code to your GitHub account.  That is a good thing.  Don't worry it only takes a few seconds.

<p align="center">
<img src="../img/ns_fork.jpg" width="550">
</p> 
</br></br>
Once the forking is done, scroll down (below all those folder and file names) until you see the purple `Deploy to Heroku` button. Click that button.
</br></br>

<p align="center">
<img src="../img/deploy_heroku.jpg" width="650">
</p> 
</br></br>
Pretty quickly, you should see a Heroku screen popup for "Create New App".  If you see that, you're good to go onto the next step to start setting up the Heroku Nightscout app.
</br></br>

## Step 5: Setup your Heroku Nightscout app

Heroku calls the code that you just deployed an "app"...but probably easier for most people to imagine it as a website. 

The first step is to give your "app" a name, this will be the prefix of your soon-to-be-created Nightscout site’s URL. For example, if you enter "janehasthesugars" then your Nightscout site's URL will be `https://janehasthesugars.herokuapp.com`

<p align="center">
<img src="../img/heroku4.png" width="650">
</p> 

Now scroll down a bit and we are going to fill out the information lines in the `Config Vars` section (circled in red above) of that page. There are many variables listed in that section, but we will only *<b>need*</b> to edit a few of them right now to get started. You can always go back later and edit the default values of your BG alarms and other defaults (or do it now, if you'd like). The variables listed below though do need you to make some edits/entries or review that the default settings work for your situation.

<table>
<thead>
<tr>
<th>VARIABLE</th>
<th>VALUE</th>
</tr>
</thead>
<tbody>
<tr>
<th>API_SECRET</th>
<td>Create your own API_SECRET…this is like the password to your NS site.  Please write it down somewhere safe or commit it to memory, you will be using it in the future.  It needs to be at least 12 characters long and should NOT use the @ or ! symbols.</td>
</tr>
<tr>
<th>MONGODB_URI</th>
<td>The MONGODB_URI that you have obtained at the end of the MongoDB Atlas setup. This is required for Nightscout to connect to your MongoDB cluster.
</tr>
<tr>
<th>DISPLAY_UNITS</th>
<td>default is mg/dl, you'll need to change to mmol if that's what you use</td>
</tr>
<tr>
<th>ENABLE</th>
<td>bridge pump iob cob basal careportal sage cage bage override</br></br>(Enter all of the words above without commas.  Just add a single space between each word. Make sure autocorrect does not add space between careportal. Typically, the words basal and careportal will already be there waiting for you.)</td>
</tr>
<tr>
<th>BRIDGE_USER_NAME</th>
<td>This setting is only needed if you're using Dexcom Share. Enter your Dexcom Share Account login name. This is not an email address. This should be the same account name used in the Dexcom app.</td>
</tr>
<tr>
<th>BRIDGE_PASSWORD</th>
<td>Enter your Dexcom Share Account password.</td>
</tr>
<tr>
<th>BRIDGE_SERVER</th>
<td>The default assumes the Dexcom user is using a US Dexcom account. <b><u>If you are outside the US, you need to change this entry to EU.</b></u></td>
</tr>
</tbody>
</table>
</br>

!!!info "MOST COMMON ERRORS"
    The `BRIDGE_PASSWORD` and `BRIDGE_USER_NAME` are NOT visible from within your Dexcom app or online account. The values for them are what you entered into your Dexcom mobile app when you VERY FIRST logged into that app however long ago. The `BRIDGE_USER_NAME` is not an email address. The most common error on initial Nightscout setups is that people incorrectly use an old account or an old password. To test your username and password, go to <a href="https://clarity.dexcom.com" target="_blank">Dexcom's Clarity</a> page and try logging into your Dexcom account. If your account info doesn't let you in, or you don't see data in your Clarity account...then you need to figure out your actual credentials before moving ahead.

!!!info ""
    If you are using Dexcom Share outside the United States, you will need to make sure you have EU in the BRIDGE_SERVER.
    </br>
    <table>
    <thead>
    <tr>
    <th>KEY</th>
    <th>VALUE</th>
    </tr>
    </thead>
    <tbody>
    <tr>
    <th>BRIDGE_SERVER</th>
    <p alighn="left"><td>EU</td>
    </tr>
    </tbody>
    </table>

Now that we have all the variables fixed up, click the purple `Deploy` button at the bottom of screen
</br></br>
<p align="center">
<img src="../img/deploy_button.jpg" width="650">
</p> 
</br></br>
Wait about 5 minutes while Heroku builds your Nightscout app. You’ll see some text scroll by in the Build App box, and then finally, you will have a message that the app was successfully deployed.
</br></br>
<p align="center">
<img src="../img/deploy_success.jpg" width="650">
</p> 
</br></br>

Click on the `Manage App` button and then we will move onto the next step.

## Step 6: Additional Variables

Select the `Settings` tab near the top of the screen on your Heroku app. Click on `Reveal Config  Vars` button that will be partway down the page. 

<p align="center">
<img src="../img/heroku5.png" width="650">
</p> 
</br></br>
Scroll down to the bottom of the variables list until you find the last blank one. 
</br></br>

<p align="center">
<img src="../img/add_vars.jpg" width="650">
</p> 
</br></br>
If you're setting up Nightscout for use with Loop, OpenAPS or AndroidAPS, you should refer
to the documentation of these systems for additional recommended configuration. For loopers, you probably want to set something like the following:
</br></br>
<table>
<thead>
<tr>
<th>KEY</th>
<th>VALUE</th>
</tr>
</thead>
<tbody>
<tr>
<th>DEVICESTATUS_ADVANCED</th>
<td>true</td>
</tr>
<tr>
<th>PUMP_FIELDS</th>
<td>battery reservoir clock status</td>
</tr>
<tr>
<th>PUMP_RETRO_FIELDS</th>
<td>battery reservoir clock status</td>
</tr>
<tr>
<th>SHOW_PLUGINS</th>
<td>pump cob iob sage cage careportal basal</td>
</tr>
<tr>
<th>BASAL_RENDER</th>
<td>default</td>
</tr>
</tbody>
</table>
</br></br>
Finally, you might want to delete the `PAPERTRAIL_API_TOKEN` line. Heroku offers a free, tiny amount of Papertrail service (like a logging service for how the site is running), but really offers only confusion to most people later when they get a message that their "Free Papertrail Service has run out of room". Papertrail is not needed, and really doesn't provide useful info for Nightscout users anyways...so best to just delete that line and never have to get the useless email in the first place.

## Step 7: Setup Profile

Now that we have finished all the variable setup, scroll up to the top of the page and click on the `Open App` button in the top right corner of your Heroku site.

<p align="center">
<img src="../img/open_app.jpg" width="650">
</p> 

You will see black site with a profile warning at the top of the screen. Confirm to redirect to a profile set-up page.  (If it doesn't redirect automatically, refresh your webpage...might have to push the button a few times).  

<p align="center">
<img src="../img/no_profile.jpg" width="450">
</p> 

You do not have to enter all the information in the profile if you are using Loop or OpenAPS or AndroidAPS (since those will be providing the information for IOB and COB rather than letting NS calculate them), but you do have to fill out the `TimeZone`. That one is non-negotiable. I highly recommend also filling in the `Insulin to carb ratio`, `Insulin Sensitivity Factor`, and `Basal Rates` so that your information is properly displayed in Nightscout. To be clear, those values you enter in the Profile will not affect your pump or other dosing in any way, because your pump will not read them from Nightscout. It's recommened you later keep these numbers up to date if you change the dosing and you're not using a system that automatically pushes changes to the profile to Nightscout.

Click `Save` when you have entered the information.  You will be prompted to authenticate, if it is the first time you’ve used the device to make changes in your profile.  Click on the `Authenticate` link at the bottom of the site, and enter your API_SECRET to complete the authentication.

<p align="center">
<img src="../img/profile.jpg" width="650">
</p> 

</br></br>

Close out of the Profile Editor to return to the main Nightscout page and configure your NS settings.

## Step 8: Nightscout Settings
The last step is to finish your Nightscout's settings. Click on the settings (those three horizontal lines in upper right corner).  Now check that you have everything displaying correctly:

* `Render Basal` is set to either default or icicle (totally personal preference for how the temp basals show as blue lines in NS site)
* Theme is set to Colors
* Check the boxes that you’d like display pills in the SHOW PLUGINS (usually all of them except Openaps) section.

<p align="center">
<img src="../img/settings_ns.jpg" width="650">
</p>

Save the settings changes and you'll be on your way! Congrats!!

## Step 9: Uploader Settings

Don't forget to enter your new Nightscout site into your uploader settings!

* TODO: add uploader samples

## Step 10: Uptime robot

In order for your site to stay active 24/7, you’ll need to set up a free <a href="https://uptimerobot.com/">Uptime Robot</a> . The constant pings from this status-checking service will keep your Nightscout app awake.

Create a new account, and verify it with the email you get.
Log in, and click the + Monitor button.
Choose HTTP(s) for the Monitor Type, pick any Friendly Name, and enter your site URL as the URL (https://your-app-name.herokuapp.com). 
Leave the rest as-is, and click Create Monitor.

<!Source: http://www.nightscout.info/wiki/welcome/set-up-nightscout-using-heroku)
, with only minor formating changes>

## Future warning (for DIY users)

At some point in the future months, your Nightscout site will likely stop in some quirky way...like CGM data won't be showing is the most common. This won't affect Looping, but it might be kind of annoying if you are a parent using Nightscout for remote info. The reason? The database Heroku gives us for free has some size limitations. After several months of Looping, you'll likely fill up that free amount of space and we will need to cleanout in order to make room.

So...keep it in your head that if you see something odd with your NS site (like no CGM even though Dexcom is working), then please check [this page to learn how you can cleanout the database](https://loopkit.github.io/loopdocs/nightscout/mlab_cleanup/). It is easy and fast...no worries.
