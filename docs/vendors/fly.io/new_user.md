
# Fly.io Nightscout

<span style="font-size:smaller;">**APPLIES TO:**</span> <img src="../../../vendors/img/flyio-logo.png" style="zoom:60%;" />+<img src="../../../vendors/img/Atlas.png" style="zoom:80%;" />

</br>

!!!info "Too complicated? Not what you're looking for? Consider a hosted Nightscout service! Check for easier solutions [here](../../../#nightscout-as-a-service)."  
<span style="font-size:larger;">Interested in building a Nightscout DIY site?  Make sure you **read and understand [this](/#how-much-does-it-cost)** before starting.</span>

</br>

**Pros**:  

> Pay-as-you-go Hobby plan allows you to run Nightscout [for free](https://fly.io/docs/about/pricing/#plans) 

**Cons**:  

>Using the M0 [MongoDB Atlas](../../mongodb/atlas/) database  
>Creation, maintenance and upgrade involve CLI and are complex  

</br></span>

</br>

## Step 1: Create a GitHub account and fork the Nightscout project

If you already have a GitHub account, [update](../../../nightscout/github/#update-your-nightscout-fork) your Nightscout project.

If you don't have a GitHub account [create one](../../../nightscout/github/#create-a-github-account) then [fork the Nightscout project](../../../nightscout/github/#fork-the-nightscout-project) and come back.

</br>

## Step 2: Download fly.io Command Line Interface (CLI)

Fly.io is mainly managed through a command line interface (CLI). The first step will be installing the CLI [which is documented here](https://fly.io/docs/flyctl/installing/). 

<br>

## Step 3: Create a fly.io account

a) `flyctl auth signup` will begin the signup process, alternatively go to [https://fly.io/app/sign-up](https://fly.io/app/sign-up) to login.  
Sign up with Github.

</br>

b) Authorize Fly.io for GitHub:

<img src="../img/fly.io-github-auth.png" style="zoom:80%;" />

</br>

c) You don't need to input card information to get Nightscout running so click the `Try fly.io for free` button:

<img src="../img/try-fly.io-free.png" style="zoom:80%;" />

</br>

## Step 4: Create an Atlas account

Follow [these steps](../../../vendors/mongodb/atlas/#create-an-atlas-database) and come back with your `MONGODB_URI` connection string.

</br></br>

## Step 5: Locally fork and deploy cgm-remote-monitor

a) Clone the `cgm-remote-monitor` repository locally:

If necessary install [Git](https://git-scm.com/downloads) on your computer (pick your own OS in Downloads).

Open a PowerShell (Windows) or a terminal (OSX/Linux), and type (replace `yourGitHubNameHere` by your own GitHub account name):

```
git clone https://github.com/yourGitHubNameHere/cgm-remote-monitor
```

<img src="../img/FlyIO01.png" style="zoom:80%;" />

</br>

b) Navigate to the directory where you code has been cloned locally

```
cd cgm-remote-monitor
```

</br>

c) Download this [`fly.toml`](fly.toml) deployment file and save it/copy it into your `cgm-remote-monitor` folder.

</br>

## Step 6: Setting Variables

Open the `fly.toml` configuration file in your `cgm-remote-monitor` folder and customize it.

a) `API_SECRET` will be your Nightscout site password, it needs to be at least 12 characters long and you should **NOT use spaces** if you use @ or ! symbols remember you will probably need to express them using [Percent encoding](https://en.wikipedia.org/wiki/Percent-encoding#Percent-encoding_reserved_characters) in your uploader and downloader apps. If you're not sure on how to do this, it is recommended to use only letters (uppercase + lowercase) and digits.

!!!warning "The API_SECRET is the **main password allowing full access to your Nightscout site**. Make sure it's reasonably secure (mix uppercase and lowercase letters, plus digits) and **do no not share it publicly**. If you think you exposed it by mistake, it is recommended that you **change it**."

</br>

b) Set the units to use for Nightscout where acceptable choices are `mg/dl` or `mmol/L` (or just `mmol`). 

</br>

c) Now you need the connection string you defined during the Atlas cluster creation (as the example below, but not the string below).

Make sure it looks like this one below and NOTE: THERE ARE NO < AND > CHARACTERS:

`MONGODB_URI="mongodb+srv://nightscout:soo5ecret@cluster0.xxxxx.mongodb.net/mycgmic?retryWrites=true&w=majority"`

!!! info
    Ensure you have `" "` surrounding your URI to make sure all of it is captured within the variable.

</br>

d) If you want to link your Dexcom Share account as a data source, complete the following lines: `BRIDGE_USER_NAME`, `BRIDGE_PASSWORD` and `BRIDGE_SERVER`.

!!!note  
    If you use a DIY closed loop system it is recommended that you let it upload to Nightscout instead of importing using Dexcom Share and the `bridge` plugin.

</br>

!!!info "MOST COMMON ERRORS"
    The most common error on initial Nightscout setups is that people incorrectly use an old account or an old password. To test your username and password, go to Dexcom's Clarity page (check [here for USA accounts](https://clarity.dexcom.com) and [here for the others](https://clarity.dexcom.eu)) and try logging in to your Dexcom account. If your account info isn't valid, or you don't see any data in your Clarity account... you need to figure out your actual credentials before moving ahead. See [here](../../../troubleshoot/dexcom_bridge/) for troubleshooting tips and information on your Dexcom account.

!!! note "Password"
    *Some people have had problems with their bridge connecting when their Dexcom passwords are entirely numeric. If you have connection issues in that case, try changing your password to something with a mix of numbers and letters.*

!!! info
    You need to have at least one follower to use Dexcom Share. See [here](../../../uploader/setup/#dexcom).

 </br>

e) For the ENABLE variable, copy and paste the following words (separated by a space) so that won't have to think about which you want now:

`careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors`

If you are using your Dexcom share account as a data source also add bridge at the end, after a space like this:

`careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors bridge`

!!! info
    Ensure you have `" "` surrounding your words to make sure all of it is captured within the variable.

</br>

f) You can customize other variables or leave default values.

</br>

g) You can now deploy your site with Fly.io.  
Type the following command:

```
flyctl launch
```

</br>

To the question `Would you like to copy its configuration to the new app?` answer `Y` (yes). 

To the question: `App Name (leave blank to use an auto-generated name):` answer with the same same you've put in the `fly.toml` file in the top line `app = ""`.

To the question  `Select region: ` select the region closer to where you live (using the up and down arrows).

<img src="../img/FlyIO03.png" style="zoom:80%;" />

To the question `Would you like to set up an Postgresql database now?` answer `N` (no).

To the question `Would you like to set up an Upstash Redis database now?` answer `N` (no).

To the question `Would you like to deploy now?` answer `Y` (yes). 

<img src="../img/FlyIO02.png" style="zoom:80%;" />

</br>

Deploy will take some time. Do not interrupt the process.

<img src="../img/FlyIO04.png" style="zoom:80%;" />

</br>

If you see the following text:

```
 1 desired, 1 placed, 1 healthy, 0 unhealthy [health checks: 1 total, 1 passing]
```

You have successfully deployed Nightscout in Fly.io. Congratulations.

If you see an unhealthy condition, check your `fly.toml` configuration (for missing " " for example) and type:

```
flyctl deploy
```

</br>

## Step 7: Nightscout Application Configuration

a) Once your site has processed the variables and redeployed itself it will be ready to use. In your fly.io dashboard click on the application (not the builder):

<img src="../img/fly.io-dashboard.png" style="zoom:80%;" />

</br>

b) Inside your app you should see that it is running and has a clickable hostname.

<img src="../img/fly.io-application-dashboard.png" style="zoom:80%;" />

</br>

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

i) Dexcom Share users should see data flowing in after some minutes. Other uploaders like xDrip+, Spike, xDrip4iOS, etc will need to be setup with the Nightscout address and API secret in the app.

<img src="../../../nightscout/img/NewNS48.png" style="zoom:80%;" />

</br></br>

## Step 8: Uploader setup

</br>

Continue to [uploader](../../../uploader/setup/) setup.

</br>

</br>

## Editing Config Vars in Fly.io

</br>

You will find your Nightscout variables under different forms depending on your deployment method.

If you migrated using the wizard, they will be secrets.

If you deployed a new site as explained in this documentation they will be environment variables.

</br>

### Env variables

Environment variables can be viewed with [flyctl](https://fly.io/docs/hands-on/install-flyctl) using the following command:

```
flyctl config env
```

If you want to modify a configuration variable you need to edit the `fly.toml` file in your local `cgm-remote-monitor` copy (the one you created at [step 6](#step-6-setting-variables) above).

Once variable(s) modified, save the file and run the following command (from inside your `cgm-remote-monitor`).

```
flyctl deploy
```

</br>

### Secrets

Your variables are stored as secrets if you used the migration wizard.

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

If you want to create a new variable or modify an existing one you need to use the `flyctl secrets set` command.  
For example if you want to set your Nightscout site vertical scale to linear:

```
flyctl secrets set SCALE_Y="linear" -a yourappname
```

If your `SCALE_Y` variable was already set to `linear` you will see the following message:  
`Error No change detected to secrets. Skipping release.`

When changing a variable, the app will automatically redeploy. You will see this sequence (it will take a few minutes):

```
Release v1 created
==> Monitoring deployment

 1 desired, 1 placed, 1 healthy, 0 unhealthy [health checks: 1 total, 1 passing]
--> v1 deployed successfully
```

</br>
