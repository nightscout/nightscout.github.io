# MongoDB

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../../vendors/img/Atlas.png" style="zoom:80%;" />

</br>

!!!info "Too complicated? Not what you're looking for? Consider a hosted Nightscout service! Check for easier solutions [here](../../../#nightscout-as-a-service)."  
<span style="font-size:larger;">Interested in building a Nightscout DIY site?  Make sure you **read and understand [this](/#how-much-does-it-cost)** before starting.</span>

</br>

**Pros**:  

> The sandbox M0 cluster for your Atlas database from MongoDB is [free](https://www.mongodb.com/pricing#mdb-modal-shared)  
> Nightscout has been adapted for MongoDB Atlas  

**Cons**:  

>Database size is limited to 512MiB. For learning and exploring MongoDB, not for production  
>You will eventually need to perform [cleanup](../../../nightscout/admin_tools/#database-maintenance), make sure you add [`dbsize`](../../../nightscout/setup_variables/#dbsize-database-size) in `enable` to avoid unexpected Nightscout failure  
>You can increase database size with an [M2 shared cluster](https://www.mongodb.com/docs/atlas/manage-clusters/#shared-clusters) the additional cost is 9$ per month  

</br>

!!! note "Note"
    MongoDB Atlas regularly changes the site aspect. If you encounter a page not matching this documentation search for keywords like `not now`, `skip` or `later` to continue. Report discrepancies [here](https://github.com/nightscout/nightscout.github.io/issues/new).

</br>

## Create an Atlas database

a) Open another tab at: [https://www.mongodb.com/cloud/atlas/register](https://www.mongodb.com/cloud/atlas/register)

b) Enter your information, click `Continue` then `Create account`

<img src="../../../nightscout/img/NewNS18.png" style="zoom:80%;" />

</br>

MongoDB Atlas will send you an email, if you don't receive it check your Spam folder.

<img src="../../../nightscout/img/NewNS18b.png" style="zoom:80%;" />

</br>

In the email you received from **MongoDB Atlas** (mongodb-atlas @ mongodb.com), click on `Verify email`

<img src="../../../nightscout/img/NewNS18c.png" style="zoom:80%;" />

</br>

Another browser tab will open with your confirmed MongoDB account, `Continue`.

<img src="../../../nightscout/img/NewNS18d.png" style="zoom:80%;" />

</br>

Enter some information (like below) and click `Finish`.

<img src="../../../nightscout/img/NewNS18e.png" style="zoom:80%;" />

</br>

c) Select `Create a cluster in Shared Clusters (FREE)`

<img src="../../../nightscout/img/NewNS19.png" style="zoom:80%;" />

!!!note "If you ever see this, just STOP"
    We're building a free cluster: you don't need to provide any billing information.

<img src="../../../nightscout/img/NewNS19b.png" style="zoom:70%;" />

</br>

d) Check you selected `Shared`, leave all default values and click `Create Cluster`

<img src="../../../nightscout/img/NewNS20.png" style="zoom:80%;" />

</br>

e) Select `Username and Password` and invent a database username (for example `nightscout`) and a database password (for example `soo5ecret` but please make one that's yours!).

!!! warning "Database credentials: Do not use your Atlas account credentials. Do not use special characters: only letters and numbers. No spaces."

<img src="../../../nightscout/img/NewNS25.png" style="zoom:80%;" />

Write down the password in the line below (yes, in this browser window you're reading now, unless you're reading a printed version). You’ll need it later.

<!-- <b>Database username</b> (write here ->) <input type="text" id="myUsr" value="click here, delete and put your own" size="30"> -->

<b>Database password</b> (write here ->) <input type="text" id="myPwd" value="click here, delete and put your own" size="30">

</br>

Then click `Create User`.

f) Select `My Local Environment` and in the box `My IP address` write `0.0.0.0/0` (mind these are all zeroes, not the letter O)

!!!warning "If you don't allow access from anywhere (IP 0.0.0.0/0) Nightscout will not be able to access your database."

<img src="../../../nightscout/img/NewNS23.png" style="zoom:80%;" />

Then click `Add Entry`.

</br>

g) Click on `Finish and Close`

<img src="../../../nightscout/img/NewNS24.png" style="zoom:80%;" />

</br>

h) Click on `Go to Databases`

<img src="../../../nightscout/img/NewNS24b.png" style="zoom:80%;" />

</br>

i) Atlas will create your default cluster, it can take more than 3 minutes

<img src="../../../nightscout/img/NewNS21.png" style="zoom:80%;" />

</br>

j) Click on `CONNECT`

<img src="../../../nightscout/img/NewNS22.png" style="zoom:100%;" />

</br>

k) If displayed, click on `Choose a connection method` (else skip)

<img src="../../../nightscout/img/NewNS26.png" style="zoom:80%;" />

</br>

l) Select `Connect your application`

<img src="../../../nightscout/img/NewNS27.png" style="zoom:80%;" />

</br>

m) Copy the connection string: click `Copy` and paste it somewhere to edit it (like Notepad).

<img src="../../../nightscout/img/NewNS28.png" style="zoom:100%;" />

</br>

n) Paste the string in the line below (yes, in this browser window you're reading now, unless you're reading a printed version).

(paste here ->) <input type="text" id="myAtlas" value="click here, delete and paste your Atlas connection string" size="100">

</br>

!!!info "It should be similar to this (`xxxxx` will be different):"
    `mongodb+srv://nightscout:<password>@cluster0.xxxxx.mongodb.net/?retryWrites=true&w=majority`
</br>

o) (Optional) Invent a name for your database, this is not a critical information (for example `myCGMitc`). Only letters and numbers, no spaces.

Database Name (write here ->) <input type="text" id="mydB" value="" size="30">

</br>

p) Click on the word `Generate` (just here below this line: in this browser window you're reading):

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
      var iAD = sAtlas.search("mongodb.net")+12;
      bAtlas=1;
      sString = sAtlas.substring(0,iAP);
      sFinalString = sString.concat(sPwd, sAtlas.substring(iAP+10, iAD));
      sString = sAtlas.substring(iAP+10, iAD);
      sFinalString = sFinalString.concat(sdB, sAtlas.substring(iAD));
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

p) If you want to do it manually: replace `<password>` with your database password as noted previously (in the example below `soo5ecret`) and `<dbname>` by any text you want, say `mycgmic` for example. The result will be like this:

`mongodb+srv://nightscout:soo5ecret@cluster0.xxxxx.mongodb.net/myCGMitc?retryWrites=true&w=majority`

!!! note
    **There should be NO `<` and NO `>` characters in the final string, neither for password nor for database name.**

</br>

You have completed a MongoDB Atlas database creation.  
Now that you have **copied** the resulting `MONGODB_URI` string to a **safe place**, go back to the instructions page you were following.

</br>

