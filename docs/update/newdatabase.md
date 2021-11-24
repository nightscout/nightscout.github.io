# Attach a new Atlas database to your Heroku app

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../vendors/img/Heroku.png" style="zoom:80%;" />+<img src="../../vendors/img/Atlas.png" style="zoom:80%;" />

------

In December 2020, mLab stopped operations.

If you were using Heroku DIY and didn't migrate your database from mLab to Atlas you need to create a new database for your Nightscout site.

</br>

!!!note "If you prefer to follow a video"
    Use [this easy guide](https://www.youtube.com/watch?v=hXSLBACjYQo). Make sure to use only letters and numbers in database name and password. 

</br>

## Step 1: Create an Atlas account

!!! note "Note"
    MongoDB Atlas regularly changes the site aspect. If you encounter a page not matching this documentation search for keywords like `not now`, `skip` or `later` to continue. Report discrepancies [here](https://github.com/nightscout/nightscout.github.io/issues/new).

</br>

- Open another tab at: [https://www.mongodb.com/cloud/atlas/register](https://www.mongodb.com/cloud/atlas/register)


- Enter your information, click `Continue` then `Create account`


<img src="../../nightscout/img/NewNS18.png" style="zoom:80%;" />

</br>

- MongoDB Atlas will send you an email, if you don't receive it check your Spam folder.


<img src="../../nightscout/img/NewNS18b.png" style="zoom:80%;" />

</br>

- In the email you received from **MongoDB Atlas** (mongodb-atlas @ mongodb.com), click on `Verify email`


<img src="../../nightscout/img/NewNS18c.png" style="zoom:80%;" />

</br>

- Another browser tab will open with your confirmed MongoDB account, `Continue`.


<img src="../../nightscout/img/NewNS18d.png" style="zoom:80%;" />

</br>

- Enter some information (like below) and click `Finish`.


<img src="../../nightscout/img/NewNS18e.png" style="zoom:80%;" />

</br>

- Select `Create a cluster in Shared Clusters (FREE)`


<img src="../../nightscout/img/NewNS19.png" style="zoom:80%;" />

!!!note "If you ever see this, just STOP"
    We're building a free cluster: you don't need to provide any billing information.

<img src="../../nightscout/img/NewNS19b.png" style="zoom:70%;" />

</br>

- Check you selected `Shared`, leave all default values and click `Create Cluster`


<img src="../../nightscout/img/NewNS20.png" style="zoom:80%;" />

</br>

- Select `Username and Password` and invent a database username (for example `nightscout`) and a database password (for example `soo5ecret` but please make one that's yours!).


!!! warning "Database credentials: Do not use your Atlas account credentials. Do not use special characters: only letters and numbers. No spaces."

<img src="../../nightscout/img/NewNS25.png" style="zoom:80%;" />

- Write down these credentials in the lines below (yes, in this browser window you're reading now, unless you're reading a printed version). You’ll need them later.


Database password (write here ->) <input type="text" id="myPwd" value="click here, delete and put your own" size="30">

Database username (write here ->) <input type="text" id="myUsr" value="click here, delete and put your own" size="30">

</br>

- Then click `Create User`.


- Select `My Local Environment` and in the box `My IP address` write `0.0.0.0/0` (mind these are all zeroes, not the letter O)


!!!warning "If you don't allow access from anywhere (IP 0.0.0.0/0) Nightscout will not be able to access your database."

<img src="../../nightscout/img/NewNS23.png" style="zoom:80%;" />

- Then click `Add Entry`.

</br>

- Click on `Finish and Close`


<img src="../../nightscout/img/NewNS24.png" style="zoom:80%;" />

</br>

- Click on `Go to Databases`


<img src="../../nightscout/img/NewNS24b.png" style="zoom:80%;" />

</br>

- Atlas will create your default cluster, it can take more than 3 minutes

<img src="../../nightscout/img/NewNS21.png" style="zoom:80%;" />

</br>

- Click on `CONNECT`


<img src="../../nightscout/img/NewNS22.png" style="zoom:100%;" />

</br>

- Click on `Choose a connection method`


<img src="../../nightscout/img/NewNS26.png" style="zoom:80%;" />

</br>

- Select `Connect your application`


<img src="../../nightscout/img/NewNS27.png" style="zoom:80%;" />

</br>

- Copy the connection string: click `Copy` and paste it somewhere to edit it (like Notepad).


<img src="../../nightscout/img/NewNS28.png" style="zoom:100%;" />

</br>

- Paste the string in the line below (yes, in this browser window you're reading now, unless you're reading a printed version).


(paste here ->) <input type="text" id="myAtlas" value="click here, delete and paste your Atlas connection string" size="100">

</br>

!!!info "It should be similar to this (`xxxxx` will be different):"
    `mongodb+srv://nightscout:<password>@cluster0.xxxxx.mongodb.net/myFirstDatabase?retryWrites=true&w=majority`
</br>

- Invent a name for your database, this is not a critical information (for example `mycgmic`), note that default is `myFirstDatabase`. Only letters and numbers, no spaces.


Database Name (write here ->) <input type="text" id="mydB" value="click here, delete and put your own" size="30">

</br>

- Click on the word `Generate` (just here below this line: in this browser window you're reading):


<button onclick="Generate()">-> Generate</button>

<p style="font-size:25px" id="result">The connection string will appear here</p>

<script>
var bAtlas;
var sdB, sPwd;
var sFinalString = "Not defined yet";
function Generate()
{
  var sString = sFinalString;
  bAtlas=0;
  var sString = "Looks good!";
  var sAtlas = document.getElementById("myAtlas").value;
  sPwd = document.getElementById("myPwd").value;
  sdB = document.getElementById("mydB").value;
  var iAS = sAtlas.search("://");
  if(iAS!=11) { sString = "Atlas URI should start with mongodb+srv://"; }
  else
  {
    var iAP = sAtlas.search("<password>");
    if(iAP==-1) { sString = "Atlas URI should contain &lt;password&gt;"; }
    else
    {
      var iAD = sAtlas.search("myFirstDatabase");
      if(iAD==-1) { sString = "Atlas URI should contain myFirstDatabase"; }
      else
      {
      	bAtlas=1;
        sString = sAtlas.substring(0,iAP);
        sFinalString = sString.concat(sPwd, sAtlas.substring(iAP+10, iAD));
        sString = sAtlas.substring(iAP+10, iAD);
        sFinalString = sFinalString.concat(sdB, sAtlas.substring(iAD+15));
      }
    }
  }


  if(bAtlas) document.getElementById("result").innerHTML = sFinalString;
  else document.getElementById("result").innerHTML = sString;
  if(bAtlas) document.getElementById("resultbis").innerHTML = sFinalString;
}
</script>

</br>

!!!warning
    Keep this string safely aside, it is called your `MONGODB_URI`

</br>

- If you want to do it manually: replace `<password>` with your database password as noted previously (in the example below `soo5ecret`) and `<dbname>` by any text you want, say `mycgmic` for example. The result will be like this:


`mongodb+srv://nightscout:soo5ecret@cluster0.xxxxx.mongodb.net/mycgmic?retryWrites=true&w=majority`

!!! note
    There are no < and > characters in the final string, neither for password nor for database name.

</br></br>

## Step 2: Add your connection string to Heroku

</br>

Access your variables opening [Heroku](https://id.heroku.com/login).

!!! note
    Salesforce requires two-factor-authentication for more Heroku security, this is mandatory starting Feb 2022. For an overview of possible methods see [here](../../vendors/heroku).

</br>

- Select your app

<img src="../../nightscout/img/SetupNS00.png" style="zoom:80%;" />

</br>

- Click `Settings`

<img src="../../nightscout/img/SetupNS01.png" style="zoom:80%;" />

</br>

- Scroll down and click `Reveal Config Vars`

<img src="../../nightscout/img/SetupNS02.png" style="zoom:80%;" />

</br>

- Scroll down Config Vars until you’ll see `KEY` and `VALUE`


<img src="../../update/img/MigrateNS08.png" style="zoom:80%;" /> 

 </br>

-  In `KEY` write `MONGODB_URI` and paste in the field `VALUE` the connection string you obtained above from Atlas. Click Add

<img src="../../update/img/UpdateNS31.png" style="zoom:80%;" /> 

- This new key will be inserted at the bottom of the list.


</br>

## Step 3: Update Nightscout

</br>
[**Update your Nightscout to latest release!**](../update/) 

Versions older than 13.0.x won't probably run. 

Versions 13.x are not optimized for the Atlas database.

</br>

Check your [profile time zone](../../nightscout/profile_editor/#profile-view) is correct.

</br>