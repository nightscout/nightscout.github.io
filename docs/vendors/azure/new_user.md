# Nightscout in Azure (Docker)

<span style="font-size:smaller;">**APPLIES TO:**</span> <img src="../../../vendors/img/Azure.png" style="zoom:60%;" />

Yes! It's [back](https://news.microsoft.com/features/open-source-and-the-cloud-changing-the-lives-of-people-with-type-1-diabetes)!

!!!info "Cost"  
Region dependent. If you can deploy Nightscout with this guide it should be free.  
If you run into trouble during database creation you might need a Basic account.

<span style="font-size:larger;">Consider [Nightscout as a service](/#nightscout-as-a-service) as an option.</span>

</br>

**This is a transcript of the original video you'll find [here](https://www.youtube.com/watch?v=EDADrteGBnY).**

</br>

## Step 1: Create an Azure account

a) Open a web page in [https://azure.microsoft.com/en-us/free/](https://azure.microsoft.com/en-us/free/) and click Start Free.

<img src="../img/Azure01.png" style="zoom:80%;" />

</br>

b) Sign in with your Microsoft account if you have one, else use GitHub.

<img src="../img/Azure02.png" style="zoom:80%;" />

</br>

c) Agree and click Next.  
Perform necessary authentication.

<img src="../img/Azure03.png" style="zoom:80%;" />

</br>

## Step 2: Create your Nightscout database

> This is where your Nightscout data will be saved (BG, treatments, ...)

a) Click Go to the Azure portal (located here [https://portal.azure.com/](https://portal.azure.com/))

<img src="../img/Azure04.png" style="zoom:80%;" />

</br>

b) From the top left ☰ menu or the Azure Services icons, select + Create a resource.

<img src="../img/Azure05.png" style="zoom:80%;" />

</br>

c) In the search bar type `mongo ` and select `Azure Cosmos DB API for MongoDB`.

<img src="../img/Azure06.png" style="zoom:80%;" />

</br>

d) Click Create.

<img src="../img/Azure07.png" style="zoom:80%;" />

</br>

e) In Subscription select Free Trial or 3-Month Free Trial.  

<img src="../img/Azure08.png" style="zoom:80%;" />

</br>

f) Below Resource group click Create new and enter Nightscout (for example).  

<img src="../img/Azure09.png" style="zoom:80%;" />

</br>

g) Choose an Account Name for your database instance, only letters and the - character. If it's not accepted that means someone else already picked it before you: use another one.  
Select a region close to where you live in Location.

 <img src="../img/Azure10.png" style="zoom:80%;" />

</br>

!!!warning

h) Make sure you selected Apply Free Tier Discount and enabled Limit to throughput.  
If you don't: you might get charged.

<img src="../img/Azure11.png" style="zoom:80%;" />

</br>

i) Click the lower left Review + create button.

<img src="../img/Azure12.png" style="zoom:80%;" />

</br>

j) Check validation passed (else review the values you entered above).  
Click the lower left Create button.

<img src="../img/Azure13.png" style="zoom:80%;" />

Deployment will take some time. Be patient.

</br>

k) Once deployment is complete, click Go to resource.

<img src="../img/Azure14.png" style="zoom:80%;" />

</br>

l) In the left menu select Quick Start.

<img src="../img/Azure19.png" style="zoom:80%;" />

Then select Node.js

<img src="../img/Azure20.png" style="zoom:80%;" />

</br>

m) Scroll down to the Node.js 3.0 driver section and copy the string (using the copy icon at the end of the line).

<img src="../img/Azure21.png" style="zoom:80%;" />

</br>

n) Now there is something requiring modification with Nightscout 14.2.6 and below.  
Open a text editing app (Notepad, TextEdit, nano, ...) and paste the string in it. It will look like this one:

`mongodb://nightscoutdb-cgmitc:H3k4z1dQaYuDznp3Fq4h7StGOUmSOkt7JmUcqbrt1K0PGRqK8e9O9u4GCQAdfwYFO3r8mBN4mx9KPGMIiDPEJw==@nightscoutdb-cgmitc.mongo.cosmos.azure.com:10255/?ssl=true&retrywrites=false&replicaSet=globaldb&`**`maxIdleTimeMS`**`=120000&appName=@nightscoutdb-cgmitc@`

You will need to replace the text in bold above `maxIdleTimeMS` by `socketTimeoutMS`

So that the example string will become:

`mongodb://nightscoutdb-cgmitc:H3k4z1dQaYuDznp3Fq4h7StGOUmSOkt7JmUcqbrt1K0PGRqK8e9O9u4GCQAdfwYFO3r8mBN4mx9KPGMIiDPEJw==@nightscoutdb-cgmitc.mongo.cosmos.azure.com:10255/?ssl=true&retrywrites=false&replicaSet=globaldb&`**`socketTimeoutMS`**`=120000&appName=@nightscoutdb-cgmitc@`

This will be fixed in the future but for now you need to modify it...

**This is your database connection string. Keep it in a safe place: you'll need it later.**

Congratulations, you have created a new database in Azure.

</br>

## Step 3: Create your Nightscout web app

> This is the web page you'll be able to access from any device connected to the internet

a) From the top left ☰ menu or the Azure Services icons, select + Create a resource.

<img src="../img/Azure05.png" style="zoom:80%;" />

</br>

b) Search Web app and click Create.

<img src="../img/Azure22.png" style="zoom:80%;" />

</br>

c) Check you're still using your Free Trial or 3-Month free Trial.  
Open the list in Resource group and pick your group (the one you created in Step 2.f.).

<img src="../img/Azure23.png" style="zoom:80%;" />

</br>

d) Decide your site name (only lowercase and you can use `-` as a separator).  
It must be unique: check the tick box at the end of the line is green.  
If it isn't: you need to choose another name...

<img src="../img/Azure24.png" style="zoom:80%;" />

</br>

e) Now select a Docker container, in Linux.

Pick a place close to where you live in the Region selection.  
Make sure it is the same than the database region you selected in Step 2.g.

<img src="../img/Azure25.png" style="zoom:80%;" />

</br>

f) Change the plan size.

<img src="../img/Azure26.png" style="zoom:80%;" />

Select Dev /Test, F1 Free and click Apply.

<img src="../img/Azure27.png" style="zoom:80%;" />

</br>

g) Click Next: Docker > in the lower left of the page.

<img src="../img/Azure28.png" style="zoom:80%;" />

</br>

h) In Image source select Docker Hub.

<img src="../img/Azure29.png" style="zoom:80%;" />

</br>

i) In Image and tag paste the following name:

```
nightscout/cgm-remote-monitor:latest
```

<img src="../img/Azure30.png" style="zoom:80%;" />

</br>

j) Click Review + create in the lower left of the page.

<img src="../img/Azure12.png" style="zoom:80%;" />

</br>

k) Verify the summary information:  
Free sku  
Check the site Name is what you wanted  
then click Create.

<img src="../img/Azure31.png" style="zoom:80%;" />

</br>

Wait for the deployment to complete. Do not interfere.

<img src="../img/Azure33.png" style="zoom:80%;" />

</br>

Congratulations, you have created your Nightscout web app.

</br>

## Step 4: Configure your Nightscout web app

> Now you need to tell it where the database is and other important information

a) Click Go to resource

<img src="../img/Azure32.png" style="zoom:80%;" />

</br>

b) In the left menu select Configuration

<img src="../img/Azure34.png" style="zoom:80%;" />

</br>

c) Click + New application setting

<img src="../img/Azure35.png" style="zoom:80%;" />

</br>

d) In Name write `MONGODB_URI`  
Then, in the line below, Value, paste the connection string you have in your text editor (the one in Step 2.n - with socketTimeoutMS in it).

<img src="../img/Azure36.png" style="zoom:80%;" />

Then click OK.

</br>

e) Click again + New application setting (like in c. above) and write `API_SECRET` in Name.  
`API_SECRET` will be your Nightscout site password, it needs to be at least 12 characters long and you should **NOT use spaces** if you use @ or ! symbols remember you will probably need to express them using [Percent encoding](https://en.wikipedia.org/wiki/Percent-encoding#Percent-encoding_reserved_characters) in your uploader and downloader apps. If you're not sure on how to do this, it is recommended to use only letters (uppercase + lowercase) and digits.

!!!warning "The API_SECRET is the **main password allowing full access to your Nightscout site**. Make sure it's reasonably secure (mix uppercase and lowercase letters, plus digits) and **do no not share it publicly**. If you think you exposed it by mistake, it is recommended that you **change it**."

<img src="../img/Azure37.png" style="zoom:80%;" />

Click OK.

</br>

f) Click again + New application setting and write `DISPLAY_UNITS` in Name.  
Acceptable choices for the units used in Nightcout are `mg/dl` or `mmol/L` (or just `mmol`).

<img src="../img/Azure38.png" style="zoom:80%;" />

Click OK.

</br>

g) Click again + New application setting and write `DISPLAY_UNITS` in Name.  
If you don't use Dexcom Share to get your BG data in Nightscout, copy the line below to Value:

```
careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors
```

If you want to use Dexcom Share as a data source copy this one (it includes the keyword `bridge`):

```
careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors bridge
```

Click OK.

</br>

h) If you want to use Dexcom Share to have your data in Nightscout directly, you will need to add these three variable Names:

`BRIDGE_USER_NAME`   Your Dexcom account username to receive CGM data from the Dexcom Share service.  
`BRIDGE_PASSWORD`     Your Dexcom account password to receive CGM data from the Dexcom Share service.  
`BRIDGE_SERVER`          US if your Dexcom account is in the US, or, if you are bridging from the Dexcom Share service and are anywhere *outside* the US change this to EU.

!!!note  
    If you use a DIY closed loop system it is recommended that you let it upload to Nightscout instead of importing using Dexcom Share and the `bridge` plugin.

<img src="../img/Azure15.png" style="zoom:80%;" />

</br>

!!!info "MOST COMMON ERRORS"
    The most common error on initial Nightscout setups is that people incorrectly use an old account or an old password. To test your username and password, go to Dexcom's Clarity page (check [here for USA accounts](https://clarity.dexcom.com) and [here for the others](https://clarity.dexcom.eu)) and try logging in to your Dexcom account. If your account info isn't valid, or you don't see any data in your Clarity account... you need to figure out your actual credentials before moving ahead. See [here](../../../troubleshoot/dexcom_bridge/) for troubleshooting tips and information on your Dexcom account.

!!! note "Password"
    *Some people have had problems with their bridge connecting when their Dexcom passwords are entirely numeric. If you have connection issues in that case, try changing your password to something with a mix of numbers and letters.*

!!! info
    You need to have at least one follower to use Dexcom Share. See [here](../../../uploader/setup/#dexcom).

</br>

i) Click Save, then Continue.

<img src="../img/Azure39.png" style="zoom:80%;" />

</br>

j) From the menu select Overview, then Browse.

<img src="../img/Azure40.png" style="zoom:80%;" />

It will take some time before the window opens.

</br>

k) Your Nightscout site should open and direct you to a new profile creation.

<img src="../../../nightscout/img/NewNS50.png" style="zoom:100%;" />

</br>

l) Setup your `Time zone` and eventually all other fields. Do not leave any fields empty. If you don't know which value to use, just use the default value. You can change these values later at any time.

<img src="../../../nightscout/img/NewNS44.png" style="zoom:80%;" />

</br>

m) Browse down to `Authentication status` and click `Authenticate`. Enter your API secret. Click `Update`.

<img src="../../../nightscout/img/NewNS45.png" style="zoom:80%;" />

</br>

n) Click `Save`.

<img src="../../../nightscout/img/NewNS46.png" style="zoom:80%;" />

</br>

o) If the following pop-up shows up click `OK`, and check status (upper right of the window).

<img src="../../../nightscout/img/NewNS47.png" style="zoom:80%;" />

</br>

!!!warning "Status: error"  
    If you cannot save your profile this probably means you region/plan requires too many RUs to build the Cosmos database for free. Consider using a MongoDB Atlas database until we find a solution.

</br>

p) If you need to modify your profile after this, authenticate with the lock icon (top right of the page): enter your API secret. Then click on the hamburger menu and select `Profile Editor`.

<img src="../../../nightscout/img/NewNS43.png" style="zoom:80%;" />

</br>

!!!warning "Privacy warning"
    Anyone with access to the URL of your Nightscout site, can view your BG and run reports of your data. It it strongly recommended that you enable [security](../../../nightscout/security) to your site once you're done with the setup.  

</br>

q) Dexcom Share users should see data flowing in after some minutes. Other uploaders like xDrip+, Spike, xDrip4iOS, etc will need to be setup with the Nightscout address and API secret in the app.

<img src="../../../nightscout/img/NewNS48.png" style="zoom:80%;" />

</br>
