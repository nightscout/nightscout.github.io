# MongoDB Atlas Database

</br>

```{admonition} Too complicated? Not what you're looking for?
:class: seealso
Consider a hosted Nightscout service! Check for easier solutions [here](/index.md#nightscout-as-a-service).
```

</br>

```{card}
## MongoDB Atlas Database
![MongoDB Atlas](/vendors/img/Atlas.png)
^^^
MongoDB bought [mLab](https://twitter.com/chrisckchang/status/506959446753284096) in 2018 and shutdown its service in 2020. Most users migrated to MongoDB Atlas, using a free M0 database with a limited 512MB capacity. Leaving the database grow uncontrolled usually leads to a Nightscout crash.

**Pros**:
* The M0 cluster is free
* Nightscout was adapted to MongoDB Atlas

**Cons**:
* M0 clusters are designed for learning and testing, not production
* There is no warranty the M0 cluster will remain in the future
* A larger M2 cluster costs 9$ per month (consider hosted Nightscout)
* A full M0 database crashes Nightscout, this is a common issue for DIY closed loop system users
```

</br>

```{note}
MongoDB Atlas regularly changes the site aspect. If you encounter a page not matching this documentation search for keywords like `not now`, `skip` or `later` to continue. Report discrepancies [here](https://github.com/nightscout/nightscout.github.io/issues/new).
```

</br>

## Create an Atlas database

a) Open a browser tab at: [https://www.mongodb.com/cloud/atlas/register](https://www.mongodb.com/cloud/atlas/register)

b) Enter your information, click `Continue` then `Create account`

<img src="./img/NewNS18.png"  width="400px" />

</br>

MongoDB Atlas will send you an email, if you don't receive it check your Spam folder.

<img src="./img/NewNS18b.png" width="400px" />

</br>

In the email you received from **MongoDB Atlas** (mongodb-atlas @ mongodb.com), click on `Verify email`

<img src="./img/NewNS18c.png" width="400px" />

</br>

Another browser tab will open with your confirmed MongoDB account, `Continue`.

<img src="./img/NewNS18d.png" width="400px" />

</br>

Enter some information (like below) and click `Finish`.

<img src="./img/NewNS18e.png" width="600px" />

</br>

c) Select `Create a cluster in Shared Clusters (FREE)`

<img src="./img/NewNS19.png" width="300px" />

```{admonition} If you ever see this, just STOP
:class: danger
We're building a free cluster: you don't need to provide any billing information.
<img src="./img/NewNS19b.png" width="400px" />
```

</br>

d) Check you selected `Shared`, leave all default values and click `Create Cluster`

<img src="./img/NewNS20.png" width="600px" />

</br>

e) Select `Username and Password` and invent a database username (for example `nightscout`) and a database password (for example `soo5ecret` but please make one that's yours!).

```{admonition} Database credentials
:class: warning
Do not use your Atlas **account** credentials.
Do not use special characters: only letters and numbers. No spaces.
```

<img src="./img/NewNS25.png" width="600px" />

Write down the password in the line below (yes, in this browser window you're reading now, unless you're reading a printed version). You’ll need it later.

<!-- <b>Database username</b> (write here ->) <input type="text" id="myUsr" value="click here, delete and put your own" size="30"> -->

| <b>Database password</b> (write here ->) <input type="text" id="myPwd" value="" size="30"> |
| ------------------------------------------------------------ |

</br>

Then click `Create User`.

f) Select `My Local Environment` and in the box `My IP address` write `0.0.0.0/0` (mind these are all zeroes, not the letter O)

```{warning}
If you don't allow access from anywhere (IP 0.0.0.0/0) Nightscout will not be able to access your database."
```

<img src="./img/NewNS23.png" width="600px" />

Then click `Add Entry`.

</br>

g) Click on `Finish and Close`

<img src="./img/NewNS24.png" width="600px" />

</br>

h) Click on `Go to Databases`

<img src="./img/NewNS24b.png" width="500px" />

</br>

i) Atlas will create your default cluster, it can take more than 3 minutes

<img src="./img/NewNS21.png" width="600px" />

</br>

j) Click on `CONNECT`

<img src="./img/NewNS22.png" width="600px" />

</br>

k) If displayed, click on `Choose a connection method` (else skip)

<img src="./img/NewNS26.png" width="600px" />

</br>

l) Select `Drivers`

<img src="./img/NewNS27.png" width="600px" />

</br>

m) Scroll down (do not change any value) and copy the connection string: click `Copy` and paste it somewhere to edit it (like Notepad).

<img src="./img/NewNS28.png" width="600px" />

</br>

n) Paste the string in the line below (yes, in this browser window you're reading now, unless you're reading a printed version).

(paste here ->) <input type="text" id="myAtlas" value="" size="100">

</br>

```{hint}
It should be similar to this (`xxxxx` will be different):

`mongodb+srv://nightscout:<password>@cluster0.xxxxx.mongodb.net/?retryWrites=true&w=majority`
```

</br>

o) (Optional) Invent a name for your database, this is not a critical information (for example `myCGMitc`). Only letters and numbers, no spaces.

| Database Name (write here ->) <input type="text" id="mydB" value="" size="30"> |
| ------------------------------------------------------------ |

</br>

p) Click on the button `Generate` (just here below this line: in this browser window you're reading):

<button onclick="Generate()">⇒ Generate</button>

<p style="font-size:18px" id="result">The connection string will appear here</p>

</br>

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

```{warning}
Keep this string safely aside, it is called your `MONGODB_URI`
```

</br>

p) If you want to do it manually: replace `<password>` with your database password as noted previously (in the example below `soo5ecret`) and `<dbname>` by any text you want, say `mycgmic` for example. The result will be like this:

`mongodb+srv://nightscout:soo5ecret@cluster0.xxxxx.mongodb.net/myCGMitc?retryWrites=true&w=majority`

```{hint}
**There should be NO `<` and NO `>` characters in the final string, neither for password nor for database name.**
```

</br>

You have completed a MongoDB Atlas database creation.
Now that you have **copied** the resulting `MONGODB_URI` string to a **safe place**, go back to the instructions page you were following.

</br>
