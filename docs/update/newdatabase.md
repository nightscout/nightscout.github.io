# Attach a new Atlas database to your Heroku app

As of December 2020, mLab stopped operations.

If you didn't migrate your database from mLab to Atlas you need to create a new database for your Nightscout site.

</br>

!!!note "If you prefer to follow a video"
    Use [this easy guide](https://www.youtube.com/watch?v=hXSLBACjYQo). Make sure to use only letters and numbers in database name and password. 

</br>

## Step 1: Create an Atlas account

</br>

- Click here: [https://www.mongodb.com/cloud/atlas](https://www.mongodb.com/cloud/atlas) and click `Start Free`



<img src="../../nightscout/img/NewNS17.png" style="zoom:70%;" />

</br>

- Enter information then click `Get Started Free`

<img src="../../nightscout/img/NewNS18.png" style="zoom:80%;" />

</br>

- Select `Create a cluster in Shared Clusters (FREE)`

<img src="../../nightscout/img/NewNS19.png" style="zoom:80%;" />

</br>

- Leave all default values and click `Create Cluster`

<img src="../../nightscout/img/NewNS20.png" style="zoom:80%;" />

</br>

Atlas will create your default cluster, wait until completion… (can take more than 3 minutes)

<img src="../../nightscout/img/NewNS21.png" style="zoom:80%;" />

</br>

- Click on `CONNECT`

<img src="../../nightscout/img/NewNS22.png" style="zoom:100%;" />

</br>

- Click on `Allow Access from Anywhere`

!!!warning "If you don't allow access from anywhere (IP 0.0.0.0/0) Nightscout will not be able to access your database."

<img src="../../nightscout/img/NewNS23.png" style="zoom:80%;" />

</br>

- Click on `Add IP Address`

<img src="../../nightscout/img/NewNS24.png" style="zoom:80%;" />

</br>

- Add a database username (for example `nightscout`) and a database password (in the example below `soo5ecret`).

!!! warning "Database credentials"
    Do not use your Atlas account credentials. Do not use special characters: only letters and numbers.

!!! warning "Write down these credentials in the boxes below: you’ll need them later."

Database password: <input type="text" id="myPwd" value="soo5ecret" size="20">

Database username: <input type="text" id="mydB" value="mycgmic" size="20">

</br>

- Then click `Create Database User`.

<img src="../../nightscout/img/NewNS25.png" style="zoom:80%;" />

</br>

- Click on `Choose a connection method`

<img src="../../nightscout/img/NewNS26.png" style="zoom:80%;" />

</br>

- Select `Connect your application`

<img src="../../nightscout/img/NewNS27.png" style="zoom:80%;" />

</br>

- Copy the connection string: click `Copy`.

<img src="../../nightscout/img/NewNS28.png" style="zoom:100%;" />

</br>

- Paste the string in the box below.

<input type="text" id="myAtlas" value="" size="100">

</br>

!!!info "It should be similar to this (`xxxxx` will be different):"
    `mongodb+srv://nightscout:<password>@cluster0.xxxxx.mongodb.net/<dbname>?retryWrites=true&w=majority`
</br>

- Click the `Generate` button:

<button onclick="Generate()">Generate</button>

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
      var iAD = sAtlas.search("<dbname>");
      if(iAD==-1) { sString = "Atlas URI should contain &lt;dbname&gt;"; }
      else
      {
      	bAtlas=1;
        sString = sAtlas.substring(0,iAP);
        sFinalString = sString.concat(sPwd, sAtlas.substring(iAP+10, iAD));
        sString = sAtlas.substring(iAP+10, iAD);
        sFinalString = sFinalString.concat(sdB, sAtlas.substring(iAD+8));
      }
    }
  }

  if(bAtlas) document.getElementById("result").innerHTML = sFinalString;
  else document.getElementById("result").innerHTML = sString;
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

</br>

## Step 2: Add your connection string to Heroku

</br>

Access your variables opening [Heroku](https://id.heroku.com/login).

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
[**Update your Nightscout to latest release!**](.\update.md) 

Versions older than 13.0.x won't probably run. 

Versions 13.x are not optimized for the Atlas database.

</br>

Check your [profile time zone](../../nightscout/profile_editor/#profile-view) is correct.

</br>