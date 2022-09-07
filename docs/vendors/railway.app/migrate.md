# Railway + MongoDB Atlas Nightscout

---

<span style="font-size:smaller;">**APPLIES TO:**</span> <img src="../../img/railway-app-logo.png" style="zoom:80%;" />+<img src="../../../vendors/img/Atlas.png" style="zoom:80%;" />

---

!!!info "Cost"  
    [Railway.app](https://railway.app/) offers 500 free hours of execution usage per month for the [Starter plan](https://docs.railway.app/reference/plans#starter-plan) **this is not enough to cover a full month**.  
<img src="../img/RailwayFree.png" style="zoom:80%;" />

Consider [Nightscout as a service](/#nightscout-as-a-service) as an option.

</br>

Monitor the first free 500 hours to understand how much you might be charged for a Developer plan.  
If your site stops after 500 hours with more than 1.56$ credit, this mean you probably can use Railway for free subscribing to a Developer plan.  
If you are reluctant to leave a billing method to Railway, you can opt for a one-off purchase guaranteeing you access to a Developer plan until this credit will be used (which is also an insurance against seeing your site stop unexpectedly).

<img src="../img/RailwayDev.png" style="zoom:80%;" />

</br>

!!!warning "Limited compatibility"  
    Railway doesn't seem to fully support MongoDB Atlas and some Nightscout features will be missing.  
    Most probably you will only see BG and blood tests.  
    Reports are not functional, or in a limited way.

</br>

## Set up new Nightscout

### Create your Railway, MongoDB Atlas and GitHub accounts from a computer.

Do not change device/computer/browser during the setup process!

!!! note
If you have unexpected issues when creating your site, restart with another browser.

</br>

### Step 1: Create a GitHub account and fork the Nightscout project

</br>

If you don't have a GitHub account [create one](../../../nightscout/github/#create-a-github-account) and come back.  
If you already have a the `cgm-remote-monitor` project in GitHub: [delete it](../../../nightscout/github/#delete-your-own-fork-of-cgm-remote-monitor).

Now [fork the Nightscout cgm-remote-monitor project](../../../nightscout/github/#fork-the-nightscout-project) (just to make sure it will be up to date).

</br>

### Step 2: Create a MongoDB Atlas database

</br>

If you are migrating from Heroku you already have a MongoDB database, skip to Step 3.

If you're creating a brand new Railway Nightscout, create a new MongoDB Atlas database [following these steps](../../mongodb/atlas/#create-an-atlas-database).   
Come back when you have your `MONGODB_URI` connection string.

</br>

### Step 3: Create a Railway account

a) Open [Railway](https://railway.app) in a new browser tab and click `login`. Login with GitHub.

<img src="../img/Railway00.png" style="zoom:80%;" />

<img src="../img/Railway01.png" style="zoom:80%;" />

</br>

b) Select `Authorize Railway App`.

<img src="../img/Railway02.png" style="zoom:80%;" />

</br>

c) Click on `Please agree to the new terms to keep on using Railway`.

<img src="../img/Railway03.png" style="zoom:80%;" />

</br>

d) Scroll down and click `I agree with Railway's Terms of Service`.

<img src="../img/Railway04.png" style="zoom:60%;" />

</br>

e) Scroll down and click `I will not deploy any of that`.

<img src="../img/Railway05.png" style="zoom:60%;" />

</br>

f) You should now see this. You've created your Railway account,

<img src="../img/Railway06a.png" style="zoom:80%;" />

</br>

### Step 4: Create your Nightscout project

a) Click on `Create a New Project`

<img src="../img/Railway06.png" style="zoom:80%;" />

</br>

b) Select `Deploy from GitHub repo`

<img src="../img/RailwayM01.png" style="zoom:80%;" />

</br>

c) Then `Configure GitHub App`

<img src="../img/RailwayM02.png" style="zoom:80%;" />

</br>

d) Click `Only Select repositories` and from the `Select Repositories button` choose your `cgm-remote-monitor` Nightscout project. Click then `Install & Authorize`.

<img src="../img/Railway08.png" style="zoom:80%;" />

</br>

e) Select your own `cgm-remote-monitor` project

<img src="../img/RailwayM03.png" style="zoom:80%;" />

</br>

f) Click `Add variables` 

<img src="../img/RailwayM04.png" style="zoom:80%;" />

</br>

Now you will need to add your Nightscout core variables.  
Type the variable name in the left box (where you see `NEW_VARIABLE`) and the variable value in the right box (where you see `VALU3)` then click the `Add` button.

<img src="../img/RailwayM05.png" style="zoom:80%;" />

</br>

Let's start.

</br>

g) Enter the first variable: `API_SECRET` then click the `Add` button

`API_SECRET` will be your Nightscout site password, it needs to be at least 12 characters long and you should **NOT use spaces** if you use `@` or other symbols remember you will probably need to express them using [Percent encoding](https://en.wikipedia.org/wiki/Percent-encoding#Percent-encoding_reserved_characters) in your uploader and downloader apps. If you're not sure on how to do this, it is recommended to use only letters (uppercase + lowercase) and digits.

!!!warning "The API_SECRET is the **main password allowing full access to your Nightscout site**. Make sure it's reasonably secure (mix uppercase and lowercase letters, plus digits) and **do no not share it publicly**. If you think you exposed it by mistake, it is recommended that you **change it**."

<img src="../img/RailwayM06.png" style="zoom:80%;" />

</br>

h) Click the `+New Variable` button and decide the units you will be using with `DISPLAY_UNITS`, acceptable choices are `mg/dl` or `mmol/L` (or just `mmol`)  then click the `Add` button.

<img src="../img/RailwayM07.png" style="zoom:80%;" />

</br>

i) Now you need the connection string you defined during the Atlas cluster creation (as the example below, but not the string below). Copy and paste it in the `MONGODB_URI` variable field  then click the `Add` button.

!!!note "Migrating from Heroku"  
    [Edit your Heroku site variables](../../heroku/new_user#editing-config-vars-in-heroku) and copy the `MONGODB_URI` or `MONGO_CONNECTION` variable.  
    If you lost access to Heroku, [recover the connection string](../../../troubleshoot/connection_string/#recover-your-connection-string) from MongoDB Atlas.

<img src="../img/RailwayM08.png" style="zoom:80%;" />

Make sure it looks like this one below and NOTE: THERE ARE NO < AND > CHARACTERS:

`mongodb+srv://nightscout:soo5ecret@cluster0.xxxxx.mongodb.net/mycgmic?retryWrites=true&w=majority`

</br>

j) If you want to link your Dexcom Share account as a data source, add the following lines:

!!!note  
    If you use a DIY closed loop system it is recommended that you let it upload to Nightscout instead of importing using Dexcom Share and the `bridge` plugin.

In `BRIDGE_USER_NAME` put your Dexcom username (it can also be an email)  then click the `Add` button

<img src="../img/RailwayM09.png" style="zoom:80%;" />

In `BRIDGE_PASSWORD` put your Dexcom password then click the `Add` button

<img src="../img/RailwayM10.png" style="zoom:80%;" />

`BRIDGE_SERVER` is either `US` if you live in the US or `EU` if you don't then click the `Add` button

<img src="../img/RailwayM11.png" style="zoom:80%;" />

</br>

!!!info "MOST COMMON ERRORS"
    The most common error on initial Nightscout setups is that people incorrectly use an old account or an old password. To test your username and password, go to Dexcom's Clarity page (check [here for USA accounts](https://clarity.dexcom.com) and [here for the others](https://clarity.dexcom.eu)) and try logging in to your Dexcom account. If your account info isn't valid, or you don't see any data in your Clarity account... you need to figure out your actual credentials before moving ahead. See [here](../../../troubleshoot/dexcom_bridge/) for troubleshooting tips and information on your Dexcom account.

!!! note "Password"
    *Some people have had problems with their bridge connecting when their Dexcom passwords are entirely numeric. If you have connection issues in that case, try changing your password to something with a mix of numbers and letters.*

!!! info
    You need to have at least one follower to use Dexcom Share. See [here](../../../uploader/setup/#dexcom).

</br>

k) Linking your CareLink account as a data source is **has not been tested yet with Railway**. There are alternative solutions with an Android phone and a [private version of xDrip+](https://github.com/benceszasz/xDripCareLinkFollower) (recommended), or (not recommended: verify availability for your pump and country) a [computer](https://github.com/FredMK/minimed-connect-to-nightscout-wrapper) or a [Raspberry Pi](https://github.com/psonnera/minimed-connect-to-nightscout-wrapper/wiki) to bridge CareLink to Nightscout.

</br>

l) Now add `ENABLE`, copy and paste the following words (separated by a space) so that won't have to think about which you want now:

`careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors`

**If you are using your Dexcom share account as a data source** also add `bridge` at the end, after a space like this:

`careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors bridge`

<img src="../img/RailwayM11.png" style="zoom:80%;" />

!!! note "`ENABLE` words"
    You find more information about the `ENABLE` words on the: [Setup page](../../../nightscout/setup_variables)

</br>

!!!note "Migrating from Heroku"  
    If you're migrating your project from Heroku, [display all variables in Heroku](../../heroku/new_user/#editing-config-vars-in-heroku) and copy all those with a value into Railway.  
    See below how to add variables in Railway but use your Heroku values.

</br>

m) Once all variables entered wait until deploy completes.

<img src="../img/RailwayM13.png" style="zoom:80%;" />

</br>

n) You can see your new Nightscout site name in the deployment tab of your project. Click on the name to open Nightscout.  
Click on the link to open it.

<img src="../img/RailwayM14.png" style="zoom:80%;" />

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

## Editing Config Vars in Railway

</br>

a) Open [Railway](https://railway.app) and click `login`. Login with GitHub.

<img src="../img/Railway00.png" style="zoom:80%;" />

<img src="../img/Railway01.png" style="zoom:80%;" />

</br>

b) Select your Nightscout project.

<img src="../img/RailwayM15.png" style="zoom:80%;" />

</br>

c) Select your web app.

<img src="../img/RailwayM16.png" style="zoom:80%;" />

</br>

d) Click on `Variables`.

<img src="../img/RailwayM17.png" style="zoom:80%;" />

</br>

e) You can perform various operations on your variables:

1. Add a new variable with `+ New Variable`
2. View the variable value with `Show Value`
3. Edit or delete the variable or its value with the line end menu

<img src="../img/RailwayM18.png" style="zoom:80%;" />