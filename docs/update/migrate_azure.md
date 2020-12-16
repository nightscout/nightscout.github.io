# Heroku with Atlas migration is mandatory for Azure users.

</br>

!!! warning "You must migrate your existing mLab MongoDB, where all your Nightscout data are stored, to MongoDB Atlas **before December 2020** before mLab with shut down."
    This is essential to keep your Nightscout functioning.

</br> 

Read this:

[https://github.com/nightscout/cgm-remote-monitor/wiki/mLab-discontinuation-FAQ#migrating-to-atlas-for-azure-users](https://github.com/nightscout/cgm-remote-monitor/wiki/mLab-discontinuation-FAQ#migrating-to-atlas-for-azure-users)

To migrate your database you can use the guide provided by mLab:

[https://docs.mlab.com/how-to-migrate-sandbox-databases-to-atlas/](https://docs.mlab.com/how-to-migrate-sandbox-databases-to-atlas/)

</br> 

Access your accounts from a computer. Do not change device/computer/browser during the upgrade!

!!! note "If you have issues with your current browser try another one."

 </br>

# Important Prerequisite

</br>

### [Create a new Nightscout site with Heroku and Atlas.](../nightscout/new_user.md) 

</br>

## Step 1: Azure

- Login to Azure: https://azure.microsoft.com/account/ and `Sign in`.

<img src="..\img\AzureMig00.png" style="zoom:80%;" />

</br>

- Enter email, password, Sign in and Stay signed in.

<img src="..\img\AzureMig01.png" style="zoom:80%;" />

</br>

- Go to your `Portal`.

<img src="..\img\AzureMig02.png" style="zoom:80%;" />

</br>

- Select `App Services`.

<img src="..\img\AzureMig03.png" style="zoom:80%;" />

</br>

- Select your App.

<img src="..\img\AzureMig04.png" style="zoom:80%;" />

</br>

- Select `Configuration`.

<img src="..\img\AzureMig05.png" style="zoom:80%;" />

</br>

- In `Connection strings` click `mongo`.

<img src="..\img\AzureMig06.png" style="zoom:80%;" />

</br>

- Click the copy icon then `Cancel`.

<img src="..\img\AzureMig07.png" style="zoom:80%;" />

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

## Step 2: Heroku

</br>

Click this link to log in Heroku: [**https://id.heroku.com/login**](https://id.heroku.com/login)

Insert mail and password then click Log In

<img src="..\img\MigrateNS00.png" style="zoom:80%;" />

</br>

Select your Nightscout app name  

<img src="..\img\MigrateNS01a.png" style="zoom:80%;" /> 

</br>

Go to Settings

<img src="..\img\MigrateNS02a.png" style="zoom:80%;" /> 

</br>

Click Reveal Config Vars

<img src="..\img\MigrateNS03.png" style="zoom:80%;" /> 

</br>

Scroll down Config Vars until you’ll see `KEY` and `VALUE`

<img src="..\img\MigrateNS05.png" style="zoom:80%;" /> 

</br>

 In `KEY` write `MONGO_TEMP` then paste in `VALUE` the text copied in Azure, click Add.

It will look like: `mongodb://username:password@database.mlab.com:port/username `

<img src="..\img\MigrateNS06a.png" style="zoom:80%;" /> 

</br>

This new key will be inserted at the bottom of the list.

<img src="..\img\MigrateNS07a.png" style="zoom:80%;" /> 

</br>

Scroll down until you’ll find a variable named `MONGO_CONNECTION` or `MONGODB_URI`. 

This variable has been automatically created at first Nightscout distribution on Heroku. We want to make a backup.

It will look like: `mongodb+srv://username:password@cluster-zzzzzzzz.xxxxx.mongodb.net/dbname?retryWrites=true&w=majority`

<img src="..\img\MigrateNS04a.png" style="zoom:80%;" /> 

</br>

Copy the value of this variable. Scroll down Config Vars until you’ll see `KEY` and `VALUE`

<img src="..\img\MigrateNS05.png" style="zoom:80%;" /> 

</br>

 In `KEY` write `MONGODB_OLD` then paste in `VALUE`

We will not use it anymore unless migration fails and you want to roll back to your new Heroku Nightscout site.

</br>

## Step 3: mLab to Atlas

</br>

Log into mLab: [https://mlab.com/login/](https://mlab.com/login/)

<img src="..\img\AzureMig08.png" style="zoom:80%;" />

</br>

Leave the mLab window open as it is.

<img src="..\img\AzureMig09.png" style="zoom:80%;" />

</br>

Log into Atlas: [https://account.mongodb.com/account/login](https://account.mongodb.com/account/login) (solve the puzzle if required).

<img src="..\img\AzureMig10.png" style="zoom:80%;" />

</br>

At the top left, click on the cog icon.

<img src="..\img\MigrateNS19.png" />

</br>

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
<p id="auser">This is your Atlas database username</p>
<p id="muser">This is your mLab database username</p>

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
  if(bmLab!=1)
  {
    document.getElementById("auser").innerHTML = "Validate mLab first";
  }
  if(bAtlas==1)
  {
    sAusr = sAtlas.substring(14, iAP-1);
    document.getElementById("auser").innerHTML = sAusr;
    document.getElementById("muser").innerHTML = document.getElementById("user").innerHTML;
    document.getElementById("validAtlas").innerHTML = "Looks good! Verify your Atlas database username below is the same as mLab database username:";
  }
  else document.getElementById("validAtlas").innerHTML = sString; 
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
If you have your connection string skip the next instructions and [**continue here**](../migrate_azure/#connection-string).

</br>

!!! note
    If you see `Validate the mLab string first` you need to go back [there](../migrate_azure/#mongodb_uri).

!!! note
    If you see `Validate the Atlas string first` you need to go back [there](../migrate_azure/#mongo_connection).

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

If the original variable was already named `MONGO_CONNECTION` it's been updated now, don't delete it.

<img src="..\img\MigrateNS54.png" style="zoom:80%;" /> 

 </br>

Confirm with `Delete Config Var`

<img src="..\img\MigrateNS55.png" style="zoom:80%;" /> 

 </br>

Congratulations, you completed migration from Azure to Heroku and Atlas.

Browse to your Nightscout site and wait 5 minutes for a new value to show up (make sure your uploader is sending data).

If you have connection errors and your site doesn't start, proceed to [troubleshooting](../../troubleshoot/connection_string).

</br>

## Roll back to new (empty) Nightscout created as a prerequisite

!!! warning "ONLY IN CASE OF MIGRATION FAILURE"
    If you've been running into issues and prefer to keep the original newly created Nighstcout site (and lose your old data) just replace the contents of `MONGO_CONNECTION` from `MONGO_TEMP`.