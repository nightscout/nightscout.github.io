# Heroku Hobby plan Nightscout

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../../vendors/img/Heroku.png" style="zoom:80%;" />+<img src="../../../vendors/img/Atlas.png" style="zoom:80%;" />

</br>

!!!info "Cost"  
    You can deploy your Nightscout site with Heroku using a [Hobby plan (7$ per month per app)](https://www.heroku.com/pricing).  
    Keep in mind the MongoDB database size is limited to 512MB and you will eventually need to perform [cleanup](../../../nightscout/admin_tools/#database-maintenance), make sure you add [`dbsize`](../../../nightscout/setup_variables/#dbsize-database-size) in `enable` to avoid unexpected Nightscout failure. You can increase database size with an [M2 shared cluster](https://www.mongodb.com/docs/atlas/manage-clusters/#shared-clusters) the additional cost is 9$ per month.

<span style="font-size:larger;">Consider [Nightscout as a service](/#nightscout-as-a-service) as an option.</span>

</br>

------

### Create your Heroku, GitHub and Atlas accounts from a computer.

Do not change device/computer/browser during the setup process!

!!! note
    If you have unexpected issues when creating your site, restart with another browser.

!!! warning "If this is not your first attempt to deploy Nightscout"
    You might want to do some [cleanup](../../troubleshoot/cleanup/) before.

</br></br>


## Step 1: Create a GitHub account

!!! note
    **You do not need several GitHub accounts for several Heroku Nightscout sites.** You can connect one GitHub account to multiple Heroku apps and accounts.

If you don't have a GitHub account [create one](../../../nightscout/github/#create-a-github-account) and come back.

</br></br>

## Step 2: Create a Heroku account

</br>

!!!warning "Pending Heroku site modifications"  
    These instructions are still valid until Heroku will remove the Free plan from its site.

</br>

a) Click this link to create an Heroku account: [https://signup.heroku.com/login](https://signup.heroku.com/login)

b) Enter mandatory data (*) and click `CREATE FREE ACCOUNT`

<img src="../../../nightscout/img/NewNS07.png" style="zoom:80%;" />

</br>

c) Heroku will send a confirmation email, open your mail and check your inbox (check your spam-folder if not received after a couple of minutes).

<img src="../../../nightscout/img/NewNS09.png" style="zoom:70%;" />

</br>

d) Click on the activation link

<img src="../../../nightscout/img/NewNS10.png" style="zoom:80%;" />

</br>

e) Create a password, it is important that you write it down for later usage. Click `SET PASSWORD AND LOG IN`

<img src="../../../nightscout/img/NewNS11.png" style="zoom:80%;" />

</br>

f) Click `CLICK HERE TO PROCEED`

<img src="../../../nightscout/img/NewNS12.png" style="zoom:70%;" />

Read and accept Salesforce terms of service.

Se sei residente in Italia, abilita l'interruttore `Are you domiciled in Italy`, leggi e accetta le condizioni supplementari.

<img src="../../../nightscout/img/NewNS12a.png" style="zoom:70%;" />

</br>

g) Your Heroku page will open, click on your profile picture, in the top right corner, and select `Account Settings`

<img src="../../../nightscout/img/NewNS13.png" style="zoom:80%;" />

</br>

h) Click on `Billing`

<img src="../../../nightscout/img/NewNS14.png" style="zoom:80%;" />

</br>

i) Click `Add credit card`

<img src="../../../nightscout/img/NewNS15.png" style="zoom:80%;" />

</br>

j) Enter your credit card information and click `Save Details`

!!!warning "End of Heroku free plan"
    You will need to [change your plan from Free to Hobby](../hobbyplan) within November 28th 2022 to keep your Heroku app available.  
    You will be charged 7$ per month for each Heroku app.

</br>

<img src="../../../nightscout/img/NewNS16.png" style="zoom:80%;" />

</br>

k) You should now have 2 pages open: Heroku and GitHub. Leave them open.</br></br>

## Step 3: Create an Atlas account

Follow [these steps](../../../vendors/mongodb/atlas/#create-an-atlas-database) and come back.

</br></br>

## Step 4: Fork and deploy cgm-remote-monitor

a) [Fork the Nightscout cgm-remote-monitor project](../../../nightscout/github/#fork-the-nightscout-project).

</br>

b) Scroll down and click `Deploy to Heroku`

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

g) Linking your CareLink account as a data source is **not functional anymore with Heroku**. Do not use the plugin below. There are alternative solutions with an Android phone and a [private version of xDrip+](https://github.com/benceszasz/xDripCareLinkFollower) (recommended), or (not recommended: verify availability for your pump and country) a [computer](https://github.com/FredMK/minimed-connect-to-nightscout-wrapper) or a [Raspberry Pi](https://github.com/psonnera/minimed-connect-to-nightscout-wrapper/wiki) to bridge CareLink to Nightscout.

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

------

## Editing Config Vars in Heroku

</br>

Once Nightscout deployed, you can access your variables from [Heroku](https://id.heroku.com/login) in order to change or customize your site.
Variables are described [here](../../../nightscout/setup_variables/#nightscout-config-vars).



- Select your app

<img src="../../../nightscout/img/SetupNS00.png" style="zoom:80%;" />

</br>

- Click `Settings`

<img src="../../../nightscout/img/SetupNS01.png" style="zoom:80%;" />

</br>

- Scroll down and click `Reveal Config Vars`

<img src="../../../nightscout/img/SetupNS02.png" style="zoom:80%;" />

</br>

- You can modify the values clicking on the pen icon

<img src="../../../nightscout/img/SetupNS03.png" style="zoom:80%;" />

</br>

- Change the contents of `Value`  as needed then click `Save Changes`

<img src="../../../nightscout/img/SetupNS04.png" style="zoom:80%;" />

</br>

Changing a variable and saving a new value will restart your site, if the change is not actuated you might also want to [restart all dynos](../../../troubleshoot/troublehoot#restart-all-dynos).
