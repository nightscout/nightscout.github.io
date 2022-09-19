# Railway.app Nightscout

---

<span style="font-size:smaller;">**APPLIES TO:**</span> <img src="../../img/railway-app-logo.png" style="zoom:80%;" />

---

!!!info "Cost"  
    [Railway.app](https://railway.app/) offers 500 free hours of execution usage per month for the [Starter plan](https://docs.railway.app/reference/plans#starter-plan) **this is not enough to cover a full month**. Running multiple free accounts to override this limitation is [not acceptable](https://railway.app/legal/fair-use).  
    <img src="../img/RailwayFree.png" style="zoom:80%;" />  
    **You probably can use Railway for free subscribing to a [Developer plan](https://railway.app/pricing)**.  
    Monitor the first free 500 hours to understand how much you might be charged for a Developer plan. If your site stops after 500 hours with more than 1.56$ credit, this mean you can run Nightscout for free.  

!!!warning "Database"  
    Adding a database to your Railway account might increase costs.  
    The Developer plan offers Max 100 GB of Disk (Soft cap) but mind the cost $0.000231 / GB / Minute will quickly reach 5$ for a 512MB database. 

</br>

Consider [Nightscout as a service](/#nightscout-as-a-service) as an option.

</br>

## Set up a new Nightscout

### Create your Railway and GitHub accounts from a computer.

!!!note  
    Do not change device/computer/browser during the setup process!  
    If you have unexpected issues when creating your site, restart with another browser.

</br>

### Step 1: Create a GitHub account

</br>

!!! warning "Already have a GitHub account?"  
    [Delete the cgm-remote-monitor fork](../../../nightscout/github/#delete-your-own-fork-of-cgm-remote-monitor) from your GitHub (if present) before proceeding.

If you don't have a GitHub account [create one](../../../nightscout/github/#create-a-github-account) and come back.

</br>

### Step 2: Create a Railway account

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

f) You should now see this. You've created your Railway account.  
If it still shows 200 hours, refresh your browser page.

<img src="../img/Railway06a.png" style="zoom:80%;" />

</br>

g) If you need to use Nightscout for more than 500 hours per month you need to update your account to a Developer plan. Click on the `Starter Plan` information and select `Remove Resource Limits`.

<img src="../img/Railway06b.png" style="zoom:80%;" />

</br>

Enter your credit card information and select `Subscribe to a Developer Plan`.

<img src="../img/Railway06c.png" style="zoom:80%;" />

Your card will be billed 1$ that will be refund immediately. Bank fees won't be refund.

</br>

!!!note "One-off purchase"  
    <img src="../img/Railway06d.png" style="zoom:80%;" />  
    <img src="../img/Railway06e.png" style="zoom:80%;" />  
    If you are reluctant to leave a billing method to Railway, you can **opt for a one-off 5$ purchase guaranteeing you access to a Developer plan** until this credit will be used (which is also an insurance against seeing your site stop unexpectedly).  
    No billing will occur after the initial credits are fully used. They will transfer month to month (*note: we need to check for how long they transfer if not used.*) 

</br>

### Step 3: Create your database

!!!note "Already have a database?"  
    If you're migrating from another platform and you already have database connection string from another Nightsout deployment, just copy the `MONGODB_URI` or `MONGO_CONNECTION` string and keep your data!

You have several choices.

- #### You can reuse your existing MongDB Atlas database.    

!!!info "Costs"  
    Recommended for Heroku migration.

Migrating from Heroku? [Edit your Heroku site variables](../../heroku/new_user#editing-config-vars-in-heroku) and copy the `MONGODB_URI` or `MONGO_CONNECTION` variable.  
    Lost your string? [Recover it](../../../troubleshoot/atlas/#recover-your-connection-string) from MongoDB Atlas.

- #### You can create a new MongoDB Atlas database.

!!!info "Costs"  
    Recommended for a free Nightscout site.

To create a new MongoDB database follow [these instructions](../../mongodb/atlas/#create-an-atlas-database) and come back with your `MONGODB_URI` connection string.  
The Atlas database size is limited to 512MB of data and is free to try. This might evolve in the future.

- #### You can create a new Railway Mongo database.

!!!warning "Costs"  
    Adding a Railway Mongo database will not fit forever in 5$ per month.  
    If you don't keep its dimension very small (<500MB *to be checked*) you will most probably be charged for it.

a) Click `New Project` from your Dashboard screen (top right).

<img src="../../../vendors/railway.app/img/RailwayDB01.png" style="zoom:80%;" />

</br>

b) Click  `Provision MongoDB`

<img src="../../../vendors/railway.app/img/RailwayDB02.png" style="zoom:80%;" />

</br>

c) Select your new MongoDB project.

<img src="../../../vendors/railway.app/img/RailwayDB03.png" style="zoom:80%;" />

</br>

d) Go to the `Connect` page.

<img src="../../../vendors/railway.app/img/RailwayDB04.png" style="zoom:80%;" />

</br>

e) Move the mouse to the end of the line showing the `Mongo Connection URL` and click the copy icon.

<img src="../../../vendors/railway.app/img/RailwayDB05.png" style="zoom:80%;" />

</br>

!!!warning "This is an important information"

Now that you have **copied** the resulting `MONGODB_URI` string, keep it in a **safe place**, you will need it later.

</br>

### Step 4: Deploy cgm-remote-monitor

</br>

a) Click on the `Deploy on Railway` button below:

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template/6v8Ejj)

*Note: this is a temporary template until the community finds a way to get it owned by Nightscout and not only a single user.  
It doesn't include any referral code.*

</br>

b) If you see this screen, select `Connect GitHub to Deploy`.

<img src="../img/Railway07a.png" style="zoom:80%;" />

Then select `Authorize Railway App`.

<img src="../img/Railway02.png" style="zoom:80%;" />

</br>

c) Click `Configure`

<img src="../img/Railway07.png" style="zoom:80%;" />

</br>

d) Click `Install & Authorize`

<img src="../img/Railway08a.png" style="zoom:80%;" />

</br>

e) You will then see this page, scroll down to define the [required variables](../../../nightscout/setup_variables/#required-variables) for creating your Nightscout site.

<img src="../img/Railway09.png" style="zoom:80%;" />

</br>

f) Mind if you see this you will need to [delete the`cgm-remote-monitor` fork in GitHub](../../../nightscout/github/#delete-your-own-fork-of-cgm-remote-monitor) and retry `Deploy` from **a)** afterwards.

<img src="../img/Railway17.png" style="zoom:80%;" />

</br>

g) Setup your Nightscout core variables.

!!!note "Migrating from Heroku"  
    If you're migrating your project from Heroku, [display all variables in Heroku](../../heroku/new_user/#editing-config-vars-in-heroku) and copy all those with a value into Railway.  
    See below how to add variables in Railway but use your Heroku variables values.

`API_SECRET` will be your Nightscout site password, it needs to be at least 12 characters long and you should **NOT use spaces** if you use @ or ! symbols remember you will probably need to express them using [Percent encoding](https://en.wikipedia.org/wiki/Percent-encoding#Percent-encoding_reserved_characters) in your uploader and downloader apps. If you're not sure on how to do this, it is recommended to use only letters (uppercase + lowercase) and digits.

!!!warning "The API_SECRET is the **main password allowing full access to your Nightscout site**. Make sure it's reasonably secure (mix uppercase and lowercase letters, plus digits) and **do no not share it publicly**. If you think you exposed it by mistake, it is recommended that you **change it**."

<img src="../img/Railway10.png" style="zoom:80%;" />

h) At **Step 3** you created your database and came back with a MONGODB_URI string. Time has come to use it here.  


<img src="../img/Railway21.png" style="zoom:80%;" />

</br>

##### Dexcom Bridge

i) If you use [Dexcom `bridge`](../../../troubleshoot/dexcom_bridge/) you need to configure these two variables with your Dexcom credentials:

<img src="../img/Railway33.png" style="zoom:80%;" />

<img src="../img/Railway34.png" style="zoom:80%;" />

If you're using Dexcom Share in the US you should put **US**, in **any other case it must be EU**.  
If you don't see it proposed at this point you'll need to **browse the list below to find it and modify it**.

<img src="../img/Railway36.png" style="zoom:80%;" />

**Remember to add `bridge` at the end of the `enable` variable in the list below.**

!!!info "MOST COMMON ERRORS"
    The most common error on initial Nightscout setups is that people incorrectly use an old account or an old password. To test your username and password, go to Dexcom's Clarity page (check [here for USA accounts](https://clarity.dexcom.com) and [here for the others](https://clarity.dexcom.eu)) and try logging in to your Dexcom account. If your account info isn't valid, or you don't see any data in your Clarity account... you need to figure out your actual credentials before moving ahead. See [here](../../../troubleshoot/dexcom_bridge/) for troubleshooting tips and information on your Dexcom account.

!!! note "Password"
    *Some people have had problems with their bridge connecting when their Dexcom passwords are entirely numeric. If you have connection issues in that case, try changing your password to something with a mix of numbers and letters.*

!!! info
    You need to have at least one follower to use Dexcom Share. See [here](../../../uploader/setup/#dexcom).

</br>

j) Many optional variables are already setup for you, open the caret to see them and eventually modify them (**recommended**).

<img src="../img/Railway15.png" style="zoom:80%;" />

</br>

k) Select the units you’re using in `DISPLAY_UNITS` acceptable choices are `mg/dl` or `mmol/L` (or just `mmol`).

<img src="../img/Railway13.png" style="zoom:80%;" />

</br>

l) You can update the alarms values. See [here](../../../nightscout/setup_variables/#alarms) for the meaning of each one.

<img src="../img/Railway37.png" style="zoom:80%;" />

</br>

m) If you want to ensure that ONLY someone with permission to view your site (e.g., a token or the `API_SECRET`) is able to view the data, you should configure the [`AUTH_DEFAULT_ROLES`](../setup_variables/#auth_default_roles) variable in as `denied`.  
If you want your site to be visible to anybody leave it as `readable`.

<img src="../img/Railway11.png" style="zoom:80%;" />

</br>

n) A common list of [`enable`](../../../nightscout/setup_variables/#enable) variables is predefined, you can change them if you know why.  
It's recommended that you leave them like this for now.

Just remember to add `bridge` at the end if your get your BG values from Dexcom Share.

<img src="../img/Railway14.png" style="zoom:80%;" />

</br>

o) You can modify the variables values, check the [documentation](../../../nightscout/setup_variables) for the meaning of each one.  
Make sure you don't make typo errors, some will crash your site (like for example `LANGUAGE` value in upercase).

</br>

p) You can now `Deploy`, and wait until it is complete.

<img src="../img/Railway16.png" style="zoom:80%;" />

If you see this message, deploy didn't complete, let's fix this manually.

<img src="../img/Railway41.png" style="zoom:80%;" />

p1)  Select `Settings` and scroll down to `Service`.  
Disconnect your `Source Repo` with the cross at the end of the line.

<img src="../../../vendors/railway.app/img/RailwayT01.png" style="zoom:80%;" />

p2) Confirm `Disconnect`.

<img src="../../../vendors/railway.app/img/RailwayT02.png" style="zoom:80%;" />

</br>

p3) Select `Connect Repo`.

<img src="../../../vendors/railway.app/img/RailwayT03.png" style="zoom:80%;" />

You should be able to select your GitHub `cgm-remote-monitor` repository.

<img src="../../../vendors/railway.app/img/RailwayM03.png" style="zoom:80%;" />

Your Railway app will now automatically deploy.

</br>

q) You can see your new Nightscout site name in the deployment tab of your project. Click on the name to open Nightscout.  
Click on the link to open it.

!!!info "Railway site name"  
    You can [change your Railway site name](#change-your-railway-nightscout-site-name) in order to make it easier to remember. **Recommended**. You will do this later, before setting your uploaders.

<img src="../img/RailwayM14.png" style="zoom:80%;" />

</br>

r) Your Nightscout site should open and direct you to a new profile creation.

<img src="../../../nightscout/img/NewNS50.png" style="zoom:100%;" />

</br>

s) Setup your `Time zone` and eventually all other fields. Do not leave any fields empty. If you don't know which value to use, just use the default value. You can change these values later at any time.

<img src="../../../nightscout/img/NewNS44.png" style="zoom:80%;" />

</br>

t) Browse down to `Authentication status` and click `Authenticate`. Enter your API secret. Click `Update`.

<img src="../../../nightscout/img/NewNS45.png" style="zoom:80%;" />

</br>

u) Click `Save`.

<img src="../../../nightscout/img/NewNS46.png" style="zoom:80%;" />

</br>

v) If the following pop-up shows up click `OK`, and check status (upper right of the window).

<img src="../../../nightscout/img/NewNS47.png" style="zoom:80%;" />

</br>

w) If you need to modify your profile after this, authenticate with the lock icon (top right of the page): enter your API secret. Then click on the hamburger menu and select `Profile Editor`.

<img src="../../../nightscout/img/NewNS43.png" style="zoom:80%;" />

</br>

!!!warning "Privacy warning"
    Anyone with access to the URL of your Nightscout site, can view your BG and run reports of your data. It it strongly recommended that you enable [security](../../../nightscout/security) to your site once you're done with the setup.  

</br>

x) Dexcom Share and CareLink users should see data flowing in after some minutes. Other uploaders like xDrip+, Spike, xDrip4iOS, etc will need to be setup with the Nightscout address and API secret in the app.

<img src="../../../nightscout/img/NewNS48.png" style="zoom:80%;" />

</br>

## Change your Railway Nightscout site name

Railways automatically makes a name when creating your new site. It is rather difficult to remember.

You can change the site name but need to keep the `.up.railway.app` domain.

1. Select your Nightscout app

2. Go in `Settings`

3. In `Domains` go to the end of line and click the edit icon

4. Write your new name and check it's available

   Click `Update`

   You Nightscout URL will now be `https://`*yoursitename*`.up.railway.app`

<img src="../img/Railway38.png" style="zoom:80%;" />

</br>

Change all your [uploaders](../../../uploader/setup/) and [follower](../../../nightscout/downloaders/) devices to reflect the new URL once verified correct functioning of your Nightscout site.

</br>

## Migrate your MongoDB Atlas database to Railway

!!!warning "Not an easy operation"  
    This is not an easy operation and requires command line instructions using a computer.  
    You can have a trusted person help you perform it, if you can provide both MongoDB Atlas and Railway MongoDB connection strings.

a) Dump your Atlas database

- Follow [these instructions](../../mongodb/atlas/#backup-your-database).

- Make sure you renamed your exported database folder to `test` as this is the default database name in Railway.

b) Copy your Railway database connection string

1. Select your MongoDB database
2. Click on `Connect`
3. Click on the Copy icon

<img src="../../mongodb/img/AtlasX05.png" style="zoom:80%;" />

c) Rename the database dump folder (example for Windows below) to `test` (default)

<img src="../../mongodb/img/AtlasX07.png" style="zoom:80%;" />

</br>

d) Import your Atlas database in Railway

- Open a command line utility (CMD, Terminal, ...) and make your way to the utility folder (if you don't want to include it in your system path). For example in Windows 64bits it's in `C:\Program Files\MongoDB\Tools\100\bin`.

Type a new command starting with: `mongorestore --uri` followed by the database string you copied above in **b)3.**, run it.

<img src="../../mongodb/img/AtlasX06.png" style="zoom:80%;" />

e) Wait until the import completes. You will see a line like this before returning to the command prompt.

```
2022-09-11T09:49:35.331+0200    456003 document(s) restored successfully. 0 document(s) failed to restore.
```

The number of documents will be different but the rest should be identical.

You have completed database restore.

</br>

If you're migrating your database, make sure to [update](#editing-variables-in-railway) the `MONGODB_URI` variable string to the new URI as copied in **b)3.**.  
Refresh your Nightscout browser once deployment completes view to verify data has been imported correctly.

</br>

## Editing Variables in Railway

</br>

#### Method 1 - Web interface

This is recommended when you only need to edit or add few variables.

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

</br>

Note that each variable modification will redeploy your project.

</br>

#### Method 2 - Raw Editor

This is recommended when you must perform lots of changes to avoid multiple project redeploys.

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

e) Click on `RAW Editor` top right

<img src="../img/Railway39.png" style="zoom:80%;" />

</br>

f) You can access all your variables in a text editor, each line contains the variable name, the sign `=` then its corresponding value.

`VARIABLE=value`

Perform all your changes taking care of uppercase and lowercase information and click `Update Variables` when finished.

<img src="../img/Railway40.png" style="zoom:80%;" />

</br>

Once saved your project will redeploy.  
If deploy fails, check your modifications...

</br>
