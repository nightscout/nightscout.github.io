
# Fly.io Nightscout

<span style="font-size:smaller;">**APPLIES TO:**</span> <img src="../../../vendors/img/flyio-logo.png" style="zoom:60%;" />+<img src="../../../vendors/img/Atlas.png" style="zoom:80%;" />

!!!info "Cost"  
Nightscout is expected to run without charges in the [free tier](https://fly.io/docs/about/pricing/#free-tier).  
Most operations involve CLI and are rather complex for the non-technical user.   
Consider [Nightscout as a service](/#nightscout-as-a-service) as an option.

</br>

**WORK IN PROGRESS DO NOT USE**

<img src="../../../img/WIP.png" style="zoom:80%;" />

</br>

## Set up a new Nightscout

## Step 1: Create a GitHub account

If you don't have a GitHub account [create one](../../../nightscout/github/#create-a-github-account) and come back.

</br></br>

## Step 2: Download fly.io Command Line Interface (CLI)

Fly.io is mainly managed through a command line interface (CLI). The first step will be installing the CLI [which is documented here](https://fly.io/docs/flyctl/installing/). 

<br>

## Step 3: Create a fly.io account

a) `flyct auth signup` will begin the signup process, alternatively go to [https://fly.io/app/sign-up](https://fly.io/app/sign-up) to login.  
Sign up with Github.

</br>

b) Authorize Fly.io for GitHub:

<img src="../img/fly.io-github-auth.png" style="zoom:80%;" />

</br>

c) You don't need to input card information to get Nightscout running so click the `Try fly.io for free` button:

<img src="../img/try-fly.io-free.png" style="zoom:80%;" />

</br>

## Step 4: Create an Atlas account

Follow [these steps](../../../vendors/mongodb/atlas/#create-an-atlas-database) and come back.

</br></br>

## Step 4: Fork and deploy cgm-remote-monitor

a) [Fork the Nightscout cgm-remote-monitor project](../../../nightscout/github/#fork-the-nightscout-project).

</br>

b) clone the fork locally 

<!-- *Note: this needs documentation.*
*Using Git / Git Bash is better. Else download the zipped file and extract it in a place you can find back easily.* -->

</br>

c) Open a terminal and navigate to the directory where you code has been cloned locally

<!-- *Note: this needs documentation.* -->

</br>

d) Deploy Nightscout into fly.io by typing `flyctl launch`

!!! note "You're getting into the core setup of your site"

    Below you'll see the minimum required configuration, you can modify the variables later in the flyctl command line tool.

</br>

## Step 5: Setting Variables

When changing a secret, the app will automatically redeploy. You will see this sequence (it will take a few minutes):

```
Release v1 created
==> Monitoring deployment

 1 desired, 1 placed, 1 healthy, 0 unhealthy [health checks: 1 total, 1 passing]
--> v1 deployed successfully
```

Until near the end of this step the CLI will report that you have a critical error because the app doesn't have all the variables it needs to start. Once you see the critical error notification in your terminal you can `ctrl-c` and exit that command process. 

 </br>
!!! note
    If you want to create a new secret or modify an existing one you need to use the `flyctl secrets set` command.  
    For example if you want to set a variable to **Th1515MyP455w0rd**, type:

    ```
    flyctl secrets set MY_MAD_VARIABLE="Th1515MyP455w0rd" -a yourappname
    ```
    
    *Note: replace `yourappname` in the example with the real name of your Fly.io Nightscout app although this is not always required if working in the directory you've deployed from as it already has that context.

!!!warning "Secrets"  
    You **cannot see the values of your secret variables as they are secret**.  
    You can only delete them and set them: you **cannot edit them**.  
    Please make sure you write them down somewhere!

</br>

Fly.io variables are named `Secrets` and you cannot visualize them.  
Look [here](https://fly.io/docs/getting-started/working-with-fly-apps/#working-with-secrets) for more details.

</br>

a) `API_SECRET` will be your Nightscout site password, it needs to be at least 12 characters long and you should **NOT use spaces** if you use @ or ! symbols remember you will probably need to express them using [Percent encoding](https://en.wikipedia.org/wiki/Percent-encoding#Percent-encoding_reserved_characters) in your uploader and downloader apps. If you're not sure on how to do this, it is recommended to use only letters (uppercase + lowercase) and digits.

!!!warning "The API_SECRET is the **main password allowing full access to your Nightscout site**. Make sure it's reasonably secure (mix uppercase and lowercase letters, plus digits) and **do no not share it publicly**. If you think you exposed it by mistake, it is recommended that you **change it**."

To create secrets in fly.io use the `flyctl secrets` command. 

To set the `API_SECRET` type

```
flyctl secrets set API_SECRET=MyAPISecret123
```

where `MyAPISecret123` is your API Secret.

</br>

b) If you want to link your Dexcom Share account as a data source, complete the following lines:

!!!note  
    If you use a DIY closed loop system it is recommended that you let it upload to Nightscout instead of importing using Dexcom Share and the `bridge` plugin.

</br>

!!!info "MOST COMMON ERRORS"
    The most common error on initial Nightscout setups is that people incorrectly use an old account or an old password. To test your username and password, go to Dexcom's Clarity page (check [here for USA accounts](https://clarity.dexcom.com) and [here for the others](https://clarity.dexcom.eu)) and try logging in to your Dexcom account. If your account info isn't valid, or you don't see any data in your Clarity account... you need to figure out your actual credentials before moving ahead. See [here](../../../troubleshoot/dexcom_bridge/) for troubleshooting tips and information on your Dexcom account.

!!! note "Password"
    *Some people have had problems with their bridge connecting when their Dexcom passwords are entirely numeric. If you have connection issues in that case, try changing your password to something with a mix of numbers and letters.*

!!! info
    You need to have at least one follower to use Dexcom Share. See [here](../../../uploader/setup/#dexcom).

There are 3 dexcom share secrets to set:

    1. `BRIDGE_SERVER`: Either `EU` or `US` depending on your Dexcom clarity login.
    2. `BRIDGE_USER_NAME`:  Your Dexcom Clarity username
    3. `BRIDGE_PASSWORD`: Your Dexcom Clarity password

These are formed together into a command that looks like:

```
flyctl secrets set BRIDGE_SERVER=<EU|US> BRIDGE_USER_NAME=<MyUserName> BRIDGE_PASSWORD=<MyPassword>
```

where the arguments in the `< >` are replaced with your credentials. 

</br>

c) Set the units to use for Nightscout where acceptable choices are `mg/dl` or `mmol/L` (or just `mmol`). 
The command is:

```
flyctl secrets set DISPLAY_UNITS=<units>
```

 </br>

d) For the ENABLE variable, copy and paste the following words (separated by a space) so that won't have to think about which you want now:

`careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors`

If you are using your Dexcom share account as a data source also add bridge at the end, after a space like this:

`careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors bridge`

Now put that into a secrets command for flyctl:

```
flyctl secrets set ENABLE="careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors bridge"
```

!!! info
    Ensure you have `" "` surrounding your words to make sure all of it is captured within the variable.

</br>

e) Now you need the connection string you defined during the Atlas cluster creation (as the example below, but not the string below). Set the MONGODB_URI with:

```
flyctl secrets set MONGODB_URI="mongodb+srv://nightscout:soo5ecret@cluster0.xxxxx.mongodb.net/mycgmic?retryWrites=true&w=majority"
```

with the URI replaced with the correct string for your Mongo instance. 

Make sure it looks like this one below and NOTE: THERE ARE NO < AND > CHARACTERS:

mongodb+srv://nightscout:soo5ecret@cluster0.xxxxx.mongodb.net/mycgmic?retryWrites=true&w=majority

!!! info
    Ensure you have `" "` surrounding your URI to make sure all of it is captured within the variable.

</br>

## Step 6: Nightscout Application Configuration

a) Once your site has processed the variables and redeployed itself it will be ready to use. In your fly.io dashboard click on the application (rather than the builder):

<img src="../img/fly.io-dashboard.png" style="zoom:80%;" />

b) Inside your app you should see that it is running and has a clickable hostname.

<img src="../img/fly.io-application-dashboard.png" style="zoom:80%;" />

c) Your Nightscout site should now be ready to open and direct you to a new profile creation.

<img src="../../../nightscout/img/NewNS50.png" style="zoom:100%;" />

</br>

d) Setup your `Time zone` and eventually all other fields. Do not leave any fields empty. If you don't know which value to use, just use the default value. You can change these values later at any time.

<img src="../../../nightscout/img/NewNS44.png" style="zoom:80%;" />

</br>

e) Browse down to `Authentication status` and click `Authenticate`. Enter your API secret. Click `Update`.

<img src="../../../nightscout/img/NewNS45.png" style="zoom:80%;" />

</br>

f) Click `Save`.

<img src="../../../nightscout/img/NewNS46.png" style="zoom:80%;" />

</br>

g) If the following pop-up shows up click `OK`, and check status (upper right of the window).

<img src="../../../nightscout/img/NewNS47.png" style="zoom:80%;" />

</br>

h) If you need to modify your profile after this, authenticate with the lock icon (top right of the page): enter your API secret. Then click on the hamburger menu and select `Profile Editor`.

<img src="../../../nightscout/img/NewNS43.png" style="zoom:80%;" />

</br>

!!!warning "Privacy warning"
    Anyone with access to the URL of your Nightscout site, can view your BG and run reports of your data. It it strongly recommended that you enable [security](../../../nightscout/security) to your site once you're done with the setup.  

</br>

i) Dexcom Share and CareLink users should see data flowing in after some minutes. Other uploaders like xDrip+, Spike, xDrip4iOS, etc will need to be setup with the Nightscout address and API secret in the app.

<img src="../../../nightscout/img/NewNS48.png" style="zoom:80%;" />

</br></br>

## Step 7: Uploader setup

</br>

Continue to [uploader](../../../uploader/setup/) setup.

</br>

