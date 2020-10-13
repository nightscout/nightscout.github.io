# Atlas migration is mandatory for Heroku users with mLab.

</br>

!!! warning "You must migrate your existing mLab MongoDB, where all your Nightscout data are stored, to MongoDB Atlas **before November 2020**."
    This is essential to keep your Nightscout functioning.

</br> 

Read this:

[https://github.com/nightscout/cgm-remote-monitor/wiki/mLab-discontinuation-FAQ](https://github.com/nightscout/cgm-remote-monitor/wiki/mLab-discontinuation-FAQ)

To migrate your database you can use the video provided by mLab:

[https://docs.mlab.com/how-to-migrate-nightscout-sandbox-heroku-addons-to-atlas/](https://docs.mlab.com/how-to-migrate-nightscout-sandbox-heroku-addons-to-atlas/)

</br> 

Access your Heroku account from a computer. Do not change device/computer/browser during the upgrade!

!!! note "If you have issues with your current browser try another one."

 </br>

# Important Prerequisite

</br>

[**Update your Nightscout to latest release!**](.\update.md)

 </br>

## Step 1: Heroku

</br>

Click this link to login in Heroku: [**https://id.heroku.com/login**](https://id.heroku.com/login)

Insert mail and password then click Log In

<img src="..\img\MigrateNS00.png" style="zoom:80%;" />

 </br>

Select your Nightscout app name  

<img src="..\img\MigrateNS01.png" style="zoom:80%;" /> 

 </br>

Go to Settings

<img src="..\img\MigrateNS02.png" style="zoom:80%;" /> 

 </br>

Click Reveal Config Vars

<img src="..\img\MigrateNS03.png" style="zoom:80%;" /> 

 </br>

Scroll down until you’ll find a variable named `MONGO_CONNECTION` or `MONGODB_URI` or `MONGOLAB_URI` or similar. 

This variable has been automatically created at first Nightscout distribution on Heroku. We want to make a backup.

<img src="..\img\MigrateNS04.png" style="zoom:80%;" /> 

 </br>

Copy the value of this variable, it will look like: `mongodb://heroku_user:password@database.mlab.com:port/heroku_user `

Scroll down Config Vars until you’ll see `KEY` and `VALUE`

<img src="..\img\MigrateNS05.png" style="zoom:80%;" /> 

 </br>

 In `KEY` write `MONGO_TEMP` then paste in `VALUE` the text copied above, click Add

<img src="..\img\MigrateNS06.png" style="zoom:80%;" /> 

 </br>

This new key will be inserted at the bottom of the list.

<img src="..\img\MigrateNS07.png" style="zoom:80%;" /> 

 </br>

#### MONGODB_URI

**Also paste the value in the box below:**

<input type="text" id="myMongo" value="" size="100">

<button onclick="ValidatemLab()">Validate</button>

<p id="validmLab">Click the Validate button above to verify your string</p>
<p id="user">Click validate</p>
<p id="pwd">Click validate</p>

<script>
var bmLAB =  0;
var sUsr, sPwd;
var sFinalString = "Not defined yet";

function ValidatemLab()
{
  bmLab=0;
  var sString = "Looks good! Verify your mLab user name and password below:";
  var sMongo = document.getElementById("myMongo").value;
  var iS = sMongo.search("://");
  if(iS!=7) { sString = "MONGODB_URI should start with mongodb://"; }
  else
  {
    sMongo = sMongo.substring(2);
    var iE = sMongo.search("@");
    if(iE!=-1)
    {
      var sUsr = sMongo.substring(iS, iE);
	  var iM = sUsr.search(":");
	  if(iM!=-1)
	  {
	    sPwd = sUsr.substring(iM + 1);
	    sUsr = sUsr.substring(1,iM);
        bmLab=1;
      }
	  else sString = "MONGODB_URI should contain : between user and password";
    }
    else sString = "MONGODB_URI should contain @ after the password";
  }
  document.getElementById("validmLab").innerHTML = sString;
  if(bmLab==1)
  {
    document.getElementById("user").innerHTML = sUsr;
    document.getElementById("pwd").innerHTML = sPwd;
  }
}
</script>

</br>

All good? Then create a last entry:

Scroll down Config Vars until you’ll see `KEY` and `VALUE`

<img src="..\img\MigrateNS08.png" style="zoom:80%;" /> 

 </br>

 In `KEY` write `MONGO_CONNECTION` (leave the field `VALUE` empty) then click Add

<img src="..\img\MigrateNS09.png" style="zoom:80%;" /> 

 </br>

This new key will be inserted at the bottom of the list.

<img src="..\img\MigrateNS10.png" style="zoom:80%;" /> 

 </br>

We’ll use it later. 

Now scroll all the way up and select `Overview` (top left)

<img src="..\img\MigrateNS11.png" style="zoom:80%;" /> 

 </br>

Click `mLab MongoDB`

<img src="..\img\MigrateNS12.png" style="zoom:80%;" /> 

 </br>

Another tab will open, from mLab. **Leave it open**. 

<img src="..\img\MigrateNS62.png" style="zoom:80%;" /> 

 </br>

Go back to Heroku and select `Settings`

<img src="..\img\MigrateNS13.png" style="zoom:80%;" /> 

</br>

## Step 2: Atlas account

Now let’s create an Atlas account.

!!! warning "**Do NOT close Heroku and mLab tabs, they MUST remain opened until the end of the migration.**"

Open another tab at: [https://www.mongodb.com/cloud/atlas](https://www.mongodb.com/cloud/atlas) and click `Start Free`

<img src="..\img\MigrateNS15.png" style="zoom:80%;" /> 

 </br>

Enter information then click `Get Started Free`

<img src="..\img\MigrateNS16.png" style="zoom:80%;" /> 

 </br>

If the following page shows up, choose a name for your organization (or leave default value). Click `Skip`.

<img src="..\img\MigrateNS17.png" style="zoom:80%;" /> 

 </br>

Scroll down and click `Dismiss`

<img src="..\img\MigrateNS18.png" style="zoom:80%;" /> 

 </br>

Click your name, top right, and select `View All Organizations`.

<img src="..\img\MigrateNS19.png" style="zoom:80%;" /> 

 </br>

Click on your organization name

<img src="..\img\MigrateNS20.png" style="zoom:80%;" /> 

 </br>

Click `Settings`.

<img src="..\img\MigrateNS21.png" style="zoom:80%;" /> 

</br>

## Step 3: mLab migration

</br>

Check the mLab tab is still opened. If it’s on a login window, reopen it from Heroku.

Scroll down to `Connect to mLab`

<img src="..\img\MigrateNS22.png" style="zoom:80%;" /> 

<img src="..\img\MigrateNS23.png" style="zoom:80%;" /> 

 </br>

`Authorize` Atlas to connect to mLab

<img src="..\img\MigrateNS24.png" style="zoom:80%;" /> 

 </br>

The page will open on the connected mLab deployment

On the right click `...` in actions and select `Configure Migration`

<img src="..\img\MigrateNS25.png" style="zoom:80%;" /> 

 </br>

Click on `Create or Select Target Project`

<img src="..\img\MigrateNS26.png" style="zoom:80%;" /> 

 </br>

Click the drop down menu below `Project` and select `Create New Project`

<img src="..\img\MigrateNS27.png" style="zoom:80%;" /> 

 </br>

Insert your project name (not important) and click `Confirm Project and Continue`

<img src="..\img\MigrateNS28.png" style="zoom:80%;" />        

 </br> 

Click `Import Database Users and Continue`

<img src="..\img\MigrateNS29.png" style="zoom:80%;" /> 

 </br>

Enable Allow all IP addresses and click `Allow All And Continue`

<img src="..\img\MigrateNS30.png" style="zoom:80%;" /> 

 </br>

 Click the drop down menu below `Cluster` and select `Create most equivalent new cluster RECOMMENDED`

<img src="..\img\MigrateNS31.png" style="zoom:80%;" /> 

 </br>

 Click `Confirm Target and Continue`

<img src="..\img\MigrateNS32.png" style="zoom:80%;" /> 

 </br>

Be patient

<img src="..\img\MigrateNS33.png" style="zoom:80%;" /> 

 </br>

Click `Confirm Source and Target`

<img src="..\img\MigrateNS34.png" style="zoom:80%;" /> 

 </br>

Click `Confirm and Continue`

<img src="..\img\MigrateNS35.png" style="zoom:80%;" /> 

 </br>

Click `Begin Test Run`

<img src="..\img\MigrateNS36.png" style="zoom:80%;" /> 

 </br>

 Wait for the test to finish (be patient)

<img src="..\img\MigrateNS37.png" style="zoom:80%;" /> 

 </br>

When available, click `Confirm Connectivity`

<img src="..\img\MigrateNS38.png" style="zoom:80%;" /> 

 </br>

!!! warning "Next step is critical"
    Copy the new Atlas string and paste it in a safe place to avoid losing it.

Click on the `Copy` button.

<img src="..\img\MigrateNS39.png" style="zoom:80%;" /> 

 </br>

!!! warning "Don’t lose it"
    We’ll need it in Heroku later!

</br>

#### MONGO_CONNECTION

**Also paste the Atlas string in the box below:** 

<input type="text" id="myAtlas" value="" size="150">

<button onclick="ValidateAtlas()">Validate</button>

<p id="validAtlas">Click the Validate button above to verify your string</p>
<p id="auser">This is your username</p>

<script>
var bAtlas =  0;
var sAusr;

function ValidateAtlas()
{

  bAtlas=0;
  var sString = "Looks good! Verify your Atlas user name below:";
  var sAtlas = document.getElementById("myAtlas").value;
  var sdB = document.getElementById("myAtlas").value;
  var iAS = sAtlas.search("://");
  if(iAS!=11) { sString = "Atlas URI should start with mongodb+srv://"; }
  else
  {
    var iAP = sAtlas.search("<password>");
    if(iAP==-1) { sString = "Atlas URI should contain &lt;password&gt;"; }
    else
    {
      sString = sAtlas.substring(0,iAP);
      sFinalString = sString.concat(sPwd, sAtlas.substring(iAP+10));
      bAtlas=1;
    }
  }

  if(bAtlas==1)
  {
    sAusr = sAtlas.substring(14, iAP-1);
    document.getElementById("auser").innerHTML = sAusr;
  }
  document.getElementById("validAtlas").innerHTML = "Looks good! Verify your Atlas user name below is the same than mLab:";
}

</script>

</br>

Click `Confirm And Continue`

<img src="..\img\MigrateNS41.png" style="zoom:80%;" /> 

 </br>

!!! warning "Don’t click anything on the next step without reading!"

Click the drop-down menu on the side of `Confirm and Continue` and select `Confirm and Close`!

<img src="..\img\MigrateNS42.png" style="zoom:80%;" /> 

 </br>

Here we are, we’ll now migrate mLab to Atlas

Click `Review Process and Begin`

<img src="..\img\MigrateNS43.png" style="zoom:80%;" /> 

 </br>

 Select `I understand …` and click `Begin Migration` (be patient and wait for migration to complete, won't be long)

<img src="..\img\MigrateNS44.png" style="zoom:80%;" /> 

 </br>

Done! Click `Start Using Atlas`

<img src="..\img\MigrateNS45.png" style="zoom:80%;" /> 

 </br>

Click `I’m Done`

<img src="..\img\MigrateNS46.png" style="zoom:80%;" /> 

 </br>

 Select both `I understand …` and `I am not using …` then click `Confirm and Close `

<img src="..\img\MigrateNS47.png" style="zoom:80%;" /> 

 </br>

Your window will update, database has been migrated to Atlas

<img src="..\img\MigrateNS48.png" style="zoom:80%;" /> 

</br>

## Step 4: Connection string

 Go back to Settings in Heroku

<img src="..\img\MigrateNS49.png" style="zoom:80%;" /> 

 </br>

Click `Reveal Config Vars`

<img src="..\img\MigrateNS50.png" style="zoom:80%;" /> 

 </br>

Click `Generate` to show the string you will need to copy in `MONGO_CONNECTION`.

<button onclick="Generate()">Generate</button>

<p value="..." style="font-size:25px" id="result"></p>

</br>

<script>
function Generate()
{
  var sString = sFinalString;
  ValidatemLab();
  ValidateAtlas();
  if(bmLab==0) {sString = "Validate the mLab string first";}
  else if(bAtlas==0) {sString = "Validate the Atlas string first";}
  document.getElementById("result").innerHTML = sString;
}
</script>

!!! note
    If you see `Validate the mLab string first` you need to go back [there](../migrate_heroku/#mongodb_uri).

!!! note
    If you see `Validate the Atlas string first` you need to go back [there](../migrate_heroku/#mongo_connection).

</br>

**If you successfully generated the connection string, copy it and skip to [here](../migrate_heroku/#connection-string).**

</br>

**If you didn't manage to generate the connection string you can try the helper page [here](../update/stringhelp.html).**

</br>

**If you didn't manage to generate the connection string or you want to do it manually:**

Scroll down to `MONGO_TEMP`.

<img src="..\img\MigrateNS51.png" style="zoom:80%;" /> 

 </br>

!!!warning "The following operation is critical."
    You must insert the mLab password in your Atlas string.

You have now two strings with this format (not these values).

`mongodb+srv://heroku_zzzzzzzz:<password>@cluster-zzzzzzzz.xxxxx.mongodb.net/heroku_zzzzzzzz?retryWrites=true&w=majority`

`mongodb://heroku_zzzzzzzz:hfo7fbh6h3dummy6o60kvjojg0@yyyyyyyy.mlab.com:12345/heroku_zzzzzzzz`

Your password (do not copy it from this guide) is made of **26 characters** (if you didn't customize it) in between **:** and **@**.

In the first string you should replace `<password>`, with your real password so that it will look like this:

`mongodb+srv://heroku_zzzzzzzz:hfo7fbh6h3dummy6o60kvjojg0@cluster-zzzzzzzz.xxxxx.mongodb.net/heroku_zzzzzzzz?retryWrites=true&w=majority`

!!!note
    there are no < and > remaining in this string!

</br>

#### Connection string

Now find and edit the `MONGO_CONNECTION` variable (click the pen to edit it)

Paste the resulting string and click `Save changes`

<img src="..\img\MigrateNS53.png" style="zoom:80%;" /> 

 </br>

 Find the variable named `MONGODB_URI` or `MONGOLAB_URI` that you identified at the beginning and click the cross to delete it.

<img src="..\img\MigrateNS54.png" style="zoom:80%;" /> 

 </br>

Confirm with `Delete Config Var`

<img src="..\img\MigrateNS55.png" style="zoom:80%;" /> 

 </br>

Congratulations, you completed migration from mLab to Atlas.

Browse to your Nightscout site and wait 5 minutes for a new value to show up (make sure your uploader is sending data).

</br>

## Step 5: Update Nightscout

!!! warning "If you didn't update Nightscout before migration"
    [**Update your Nightscout to latest release!**](.\update.md) 
    Versions older than 13.0.x won't probably run. 
    Versions 13.x are not optimized for the Atlas database.

</br>

## Step 6: Delete mLab add-on (optional)

!!! warning "Warning"
    **MAKE SURE NIGHTSCOUT IS FULLY FUNCTIONAL BEFORE REMOVING THE ADD-ON**

If you want to complete the operation once you’re sure everything is working well you can remove mLab from Heroku (**and this is not necessary**).

For this, in Heroku go to `Resources`

<img src="..\img\MigrateNS58.png" style="zoom:80%;" /> 

 </br>

 On the right of the mLab MongoDB line, click the drop down menu then `Delete Add-on`

<img src="..\img\MigrateNS59.png" style="zoom:80%;" /> 

 </br>

Write the name of your app to confirm, click `Remove add-on`

<img src="..\img\MigrateNS60.png" style="zoom:80%;" /> 

 </br>

 Migration is complete and your Nightscout doesn't have anything to do with the old mLab database now.