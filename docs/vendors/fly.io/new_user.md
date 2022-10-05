
# Fly.io Nightscout

<span style="font-size:smaller;">**APPLIES TO:**</span> <img src="../../../vendors/img/flyio-logo.png" style="zoom:60%;" />+<img src="../../../vendors/img/Atlas.png" style="zoom:80%;" />

!!!info "Cost"  
Nightscout is expected to run without charges in the [free tier](https://fly.io/docs/about/pricing/#free-tier).  
Most operations involve CLI and are rather complex for the non-technical user.   
Consider [Nightscout as a service](/#nightscout-as-a-service) as an option.

</br>

## Set up a new Nightscout

## Step 1: Create a GitHub account

If you don't have a GitHub account [create one](../../../nightscout/github/#create-a-github-account) and come back.

</br></br>

## Step 2: Download fly.io Command Line Interface (CLI)

Fly.io is mainly managed through a command line interface (CLI). The first step will be installing the CLI [which is documented here](https://fly.io/docs/flyctl/installing/). 

<br>

## Step 3: Create a fly.io account

a) `flyct auth signup` will begin the signup process, alternativly go to https://fly.io/app/sign-up to login. Given a Github account has already been created in step 1 'Sign up with Github' is recommended.

b) Authorize Fly.io for Github:

<img src="../../nightscout/img/fly.io-github-auth.png" style="zoom:80%;" />

</br>

## Step 4: Create an Atlas account

Follow [these steps](../../../vendors/mongodb/atlas/#create-an-atlas-database) and come back.

</br></br>

## Step 4: Fork and deploy cgm-remote-monitor

a) [Fork the Nightscout cgm-remote-monitor project](../../../nightscout/github/#fork-the-nightscout-project).

</br>

b) clone the fork locally 

<img src="../../../nightscout/img/NewNS31.png" style="zoom:80%;" />

<img src="../../../nightscout/img/NewNS32.png" style="zoom:80%;" />

</br>

!!! note "You're getting into the core setup of your site"

    Below you'll see the minimum required configuration, you can modify the variables later in Heroku.

</br>

c) Enter your CGM in the Cloud site name: invent a name you will use to see your BG in the cloud. Confirm that the name is available.

d) Don’t change the region.

<img src="../../../nightscout/img/NewNS33.png" style="zoom:80%;" />

</br>

Scroll down and setup the following variables:

 </br>

e) `API_SECRET` will be your Nightscout site password, it needs to be at least 12 characters long and you should **NOT use spaces** if you use @ or ! symbols remember you will probably need to express them using [Percent encoding](https://en.wikipedia.org/wiki/Percent-encoding#Percent-encoding_reserved_characters) in your uploader and downloader apps. If you're not sure on how to do this, it is recommended to use only letters (uppercase + lowercase) and digits.

!!!warning "The API_SECRET is the **main password allowing full access to your Nightscout site**. Make sure it's reasonably secure (mix uppercase and lowercase letters, plus digits) and **do no not share it publicly**. If you think you exposed it by mistake, it is recommended that you **change it**."

<img src="../../../nightscout/img/NewNS34.png" style="zoom:80%;" />

</br>

f) If you want to link your Dexcom Share account as a data source, complete the following lines:

!!!note  
    If you use a DIY closed loop system it is recommended that you let it upload to Nightscout instead of importing using Dexcom Share and the `bridge` plugin.

<img src="../../../nightscout/img/NewNS35.png" style="zoom:80%;" />

</br>

!!!info "MOST COMMON ERRORS"
    The most common error on initial Nightscout setups is that people incorrectly use an old account or an old password. To test your username and password, go to Dexcom's Clarity page (check [here for USA accounts](https://clarity.dexcom.com) and [here for the others](https://clarity.dexcom.eu)) and try logging in to your Dexcom account. If your account info isn't valid, or you don't see any data in your Clarity account... you need to figure out your actual credentials before moving ahead. See [here](../../../troubleshoot/dexcom_bridge/) for troubleshooting tips and information on your Dexcom account.

!!! note "Password"
    *Some people have had problems with their bridge connecting when their Dexcom passwords are entirely numeric. If you have connection issues in that case, try changing your password to something with a mix of numbers and letters.*

!!! info
    You need to have at least one follower to use Dexcom Share. See [here](../../../uploader/setup/#dexcom).

</br>

g) Linking your CareLink account as a data source is **not possible anymore using cloud hosted Nightscout sites**.  
Use an Android bridge device with a private version of xDrip+.  
More information **[here](../../../uploader/xdripcarelink)**.

<img src="../../../nightscout/img/NewNS36.png" style="zoom:60%;" />

</br>

j) Select the units you’re using in `DISPLAY_UNITS` acceptable choices are `mg/dl` or `mmol/L` (or just `mmol`).

<img src="../../../nightscout/img/NewNS37.png" style="zoom:80%;" />

</br>

h) In `ENABLE`, copy and paste the following words (separated by a space) so that won't have to think about which you want now:

`careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors`

**If you are using your Dexcom share account as a data source** also add `bridge` at the end, after a space like this:

`careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors bridge`

<img src="../../../nightscout/img/NewNS38.png" style="zoom:80%;" />

!!! note "`ENABLE` words"
    You find more information about the `ENABLE` words on the: [Setup page](../../../nightscout/setup_variables)

</br>

i) Now you need the connection string you defined during the Atlas cluster creation (as the example below, but not the string below). Copy and paste it in the `MONGODB_URI` variable field.

<img src="../../../nightscout/img/NewNS39.png" style="zoom:80%;" />

Make sure it looks like this one below and NOTE: THERE ARE NO < AND > CHARACTERS:

`mongodb+srv://nightscout:soo5ecret@cluster0.xxxxx.mongodb.net/mycgmic?retryWrites=true&w=majority`

</br>

j) Scroll down to the end of the list and click `Deploy app`

<img src="../../../nightscout/img/NewNS40.png" style="zoom:80%;" />

</br>

k) **WAIT** until completion (will take some time). Do not interrupt the process until it's complete.

<img src="../../../nightscout/img/NewNS41.png" style="zoom:80%;" />

</br>

l) Then click `View` (if nothing happens, click `Manage App` -> `Open App`, in upper right corner)

<img src="../../../nightscout/img/NewNS42.png" style="zoom:80%;" />

</br>

m) Your Nightscout site should open and direct you to a new profile creation.

<img src="../../../nightscout/img/NewNS50.png" style="zoom:100%;" />

</br>

n) Setup your `Time zone` and eventually all other fields. Do not leave any fields empty. If you don't know which value to use, just use the default value. You can change these values later at any time.

<img src="../../../nightscout/img/NewNS44.png" style="zoom:80%;" />

</br>

o) Browse down to `Authentication status` and click `Authenticate`. Enter your API secret. Click `Update`.

<img src="../../../nightscout/img/NewNS45.png" style="zoom:80%;" />

</br>

p) Click `Save`.

<img src="../../../nightscout/img/NewNS46.png" style="zoom:80%;" />

</br>

q) If the following pop-up shows up click `OK`, and check status (upper right of the window).

<img src="../../../nightscout/img/NewNS47.png" style="zoom:80%;" />

</br>

r) If you need to modify your profile after this, authenticate with the lock icon (top right of the page): enter your API secret. Then click on the hamburger menu and select `Profile Editor`.

<img src="../../../nightscout/img/NewNS43.png" style="zoom:80%;" />

</br>

!!!warning "Privacy warning"
    Anyone with access to the URL of your Nightscout site, can view your BG and run reports of your data. It it strongly recommended that you enable [security](../../../nightscout/security) to your site once you're done with the setup.  

</br>

s) Dexcom Share and CareLink users should see data flowing in after some minutes. Other uploaders like xDrip+, Spike, xDrip4iOS, etc will need to be setup with the Nightscout address and API secret in the app.

<img src="../../../nightscout/img/NewNS48.png" style="zoom:80%;" />

</br>

##### Papertrail

- Finally, you might want to modify the `PAPERTRAIL_API_TOKEN` line. Heroku offers a free, tiny amount of Papertrail service (this is like a logging service for how the site is running), but this generates a lot of confusion to most people later on, when they get a message that their "Free Papertrail Service has run out of room". Papertrail is not needed, edit the line and add `DISABLED` at the end, so that you can recover the function if you need it later.

<img src="../../../nightscout/img/NewNS49.png" style="zoom:80%;" />

</br></br>



## Step 5: Uploader setup

</br>

Continue to [uploader](../../../uploader/setup/) setup.

</br>

## Editing Secrets in Fly.io

</br>

!!!warning "Secrets"  
    You **cannot see the values of your secret variables as they are secret**.  
    You can only delete them and set them: you **cannot edit them**.  
    Please make sure you write them down somewhere!

</br>

**Once Nightscout deployed, you need to install [flyctl](https://fly.io/docs/hands-on/install-flyctl/) to access your variables in order to change or customize your site.**
Variables are described [here](../../../nightscout/setup_variables/#nightscout-config-vars).

[Sign in with GitHub](https://fly.io/docs/hands-on/sign-in/) in your CLI interface (Powershell/Terminal).  
A new browser will open. Select the entry with your email address.  
If required, authenticate through GitHub.

<img src="../img/FlyM16.png" style="zoom:80%;" />

</br>

Fly.io variables are named `Secrets` and you cannot visualize them.  
Look [here](https://fly.io/docs/getting-started/working-with-fly-apps/#working-with-secrets) for more details.

</br>

If you want to create a new secret or modify an existing one you need to use the `flyctl secrets set` command.  
For example if you want to set your Nightscout site API Secret to **Th1515MyP455w0rd**, type:

```
flyctl secrets set API_SECRET="Th1515MyP455w0rd" -a yourappname
```

*Note: replace `yourappname` in the example with the real name of your Fly.io Nightscout app.*

If your `API_SECRET` secret was already set to `Th1515MyP455w0rd` you will see the following message:  
`Error No change detected to secrets. Skipping release.`

Now put back your original API Secret password with the same command.

When changing a secret, the app will automatically redeploy. You will see this sequence (it will take a few minutes):

```
Release v1 created
==> Monitoring deployment

 1 desired, 1 placed, 1 healthy, 0 unhealthy [health checks: 1 total, 1 passing]
--> v1 deployed successfully
```

</br>

